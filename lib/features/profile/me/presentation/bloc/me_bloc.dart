import 'package:fe_nike/features/profile/me/domain/usecases/get_me.dart';
import 'package:fe_nike/features/profile/me/presentation/bloc/me_events.dart';
import 'package:fe_nike/features/profile/me/presentation/bloc/me_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';

class MeBloc extends Bloc<MeEvents, MeStates>{

  final GetMeUseCases _getMeUseCases;

  MeBloc(this._getMeUseCases) : super(MeInitState()) {
    on<GetMeEvent>(onGetMe);
  }
  Future<void> onGetMe(MeEvents event, Emitter<MeStates> emit)async{

    final dataState = await _getMeUseCases();
    if(dataState is DataSuccess){
      emit(GetMeSuccess(dataState.data!));
    }
    if(dataState is DataError){
      emit(GetMeError(dataState.error!));
    }
  }
}