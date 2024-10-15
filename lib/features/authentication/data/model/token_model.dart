
import 'package:fe_nike/features/authentication/domain/entities/token.dart';

class TokenModel extends TokenEntity{
  const TokenModel({required super.refreshToken, required super.accessToken});
  factory TokenModel.fromJson(Map<String, dynamic> map){
    return TokenModel(
      refreshToken: map['refreshToken'] ?? '',
      accessToken: map['accessToken'] ??''
    );
  }
  factory TokenModel.fromEntity(TokenEntity token){
    return TokenModel(
      refreshToken: token.refreshToken,
      accessToken: token.accessToken
    );
  }
}