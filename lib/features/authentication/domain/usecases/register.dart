import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/domain/entities/register_entity.dart';
import 'package:fe_nike/features/authentication/domain/repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<DataState<RegisterEntity>, BodyRegister>{

  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);
  @override
  Future<DataState<RegisterEntity>> call({BodyRegister? params})  {
    return authRepository.register(params!);
  }
}