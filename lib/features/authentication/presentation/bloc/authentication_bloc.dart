

import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/domain/usecases/login.dart';
import 'package:fe_nike/features/authentication/domain/usecases/logout.dart';
import 'package:fe_nike/features/authentication/domain/usecases/register.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../util/auth_manager.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final LoginUseCase _loginUseCase;
  final LogOutUseCase _logOutUseCase;
  final RegisterUseCase _registerUseCase;
  AuthBloc(this._loginUseCase, this._logOutUseCase, this._registerUseCase): super(AuthInitState()) {
      on<AuthLogin>(_onLogin);
      on<AuthLogout>(_onLogout);
      on<AuthRegister>(_onRegister);
  }
  Future<void> _onLogin(AuthLogin event , Emitter<AuthState> emit)async{
    BodyLogin bodyLogin = BodyLogin(email: event.email, password: event.password);
    final dataState = await _loginUseCase(params: bodyLogin);
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
    //
    // print(dataState.runtimeType);
    // print(dataState.error?.response);
    // print(dataState.error?.error);
    // print(dataState.error?.message);

    if(dataState is DataSuccess){
      AuthManager.logout();
      emit(AuthInitState());
    }
    if(dataState is DataError){
      emit(AuthErrorState(dataState.error!));
    }
  }
  Future<void> _onRegister (AuthRegister event, Emitter<AuthState> emit)async{
    final dataState = await _registerUseCase(params: event.bodyRegister);
    print(dataState.runtimeType);
    print(dataState.error?.message);
    print(dataState.error?.response);
    if(dataState is DataSuccess){
      emit(RegisterSuccessState());
    }
    if(dataState is DataError){
      emit(AuthErrorState(dataState.error!));
    }
  }
}