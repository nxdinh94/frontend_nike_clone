
import 'package:fe_nike/core/constants/queries.dart';
import 'package:fe_nike/features/authentication/data/model/token_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../model/logout_model.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio, {String? baseUrl}) = _AuthServices;

  @POST('/users/login')
  Future<HttpResponse<TokenModel>> login(@Body() BodyLogin bodyLogin );

  @POST('/users/logout')
  Future<HttpResponse<LogoutModel>>logout(
    @Body() BodyLogout bodyLogout,
  );
}

@JsonSerializable()
class BodyLogin{
  BodyLogin({required this.email, required this.password});

  factory BodyLogin.fromJson(Map<String, dynamic> json) => _$BodyLoginFromJson(json);
  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$BodyLoginToJson(this);
}

@JsonSerializable()
class BodyLogout{
  BodyLogout({required this.refreshToken});

  factory BodyLogout.fromJson(Map<String, dynamic> json) => _$BodyLogoutFromJson(json);
  final String refreshToken;

  Map<String, dynamic> toJson() => _$BodyLogoutToJson(this);
}