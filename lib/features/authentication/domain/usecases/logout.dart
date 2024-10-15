
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/domain/repositories/auth_repository.dart';

import '../../data/model/logout_model.dart';
import '../entities/logout_entity.dart';

class LogOutUseCase extends UseCase<DataState<LogoutEntity>, BodyLogout>{
  final AuthRepository authRepository;
  LogOutUseCase(this.authRepository);

  @override
  Future<DataState<LogoutEntity>> call({BodyLogout ? params}) {
    return authRepository.logout(params!);
  }



}