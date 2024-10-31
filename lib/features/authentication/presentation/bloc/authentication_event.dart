import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';

sealed class AuthEvent{

}

final class AuthLogin extends AuthEvent{
  AuthLogin({required this.email, required this.password});
  final String email;
  final String password;
}

final class AuthLogout extends AuthEvent{
  AuthLogout({required this.accessToken, required this.refreshToken});
  final String accessToken;
  final String refreshToken;
}

final class AuthRegister extends AuthEvent{
  final BodyRegister bodyRegister;
  AuthRegister({required this.bodyRegister});
}