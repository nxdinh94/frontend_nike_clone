
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/profile/me/domain/entities/me_entity.dart';

abstract class MeStates extends Equatable{
  final MeEntity ? me;
  final DioException ? error;
  const MeStates({this.me, this.error});
  @override
  List<Object?> get props => [me, error];
}
class MeInitState extends MeStates {}

class GetMeLoadingState extends MeStates {}

class GetMeSuccess extends MeStates{
  const GetMeSuccess(MeEntity meEntity): super(me: meEntity);
}
class GetMeError extends MeStates{
  const GetMeError(DioException error) : super(error: error);
}
