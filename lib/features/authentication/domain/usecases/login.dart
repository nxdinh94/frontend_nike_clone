
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/domain/entities/token.dart';
import 'package:fe_nike/features/authentication/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<DataState<TokenEntity>, BodyLogin>{
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  @override
  Future<DataState<TokenEntity>> call({BodyLogin? params}) {
    return _authRepository.login(params!);
  }
}