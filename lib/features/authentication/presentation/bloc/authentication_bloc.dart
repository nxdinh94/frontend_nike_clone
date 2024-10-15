

import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/domain/usecases/login.dart';
import 'package:fe_nike/features/authentication/domain/usecases/logout.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../util/auth_manager.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final LoginUseCase _loginUseCase;
  final LogOutUseCase _logOutUseCase;
  AuthBloc(this._loginUseCase, this._logOutUseCase): super(AuthInitState()) {
      on<AuthLogin>(_onLogin);
      on<AuthLogout>(_onLogout);
  }
  Future<void> _onLogin(AuthLogin event , Emitter<AuthState> emit)async{
    BodyLogin bodyLogin = BodyLogin(email: event.email, password: event.password);
    final dataState = await _loginUseCase(params: bodyLogin);

    print(dataState.error?.response);

    if(dataState is DataSuccess){
      AuthManager.decodeAccessToken(dataState.data!.accessToken, dataState.data!.refreshToken);
      emit(AuthSuccessState(dataState.data! ));
    }
    if(dataState is DataError){
      emit(AuthErrorState(dataState.error!));
    }
  }
  Future<void> _onLogout (AuthLogout event , Emitter<AuthState> emit)async{
    BodyLogout bodyLogout = BodyLogout(refreshToken: event.refreshToken );
    final dataState = await _logOutUseCase(params: bodyLogout);

    print(dataState.runtimeType);
    print(dataState.error?.response);
    print(dataState.error?.error);
    print(dataState.error?.message);

    if(dataState is DataSuccess){
      print(dataState.data?.message);
      AuthManager.logout();
      emit(AuthInitState());
    }
    if(dataState is DataError){
      emit(AuthErrorState(dataState.error!));
    }
  }
}