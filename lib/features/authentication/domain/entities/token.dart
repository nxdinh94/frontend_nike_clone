
import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable{
  final String refreshToken;
  final String accessToken;

  const TokenEntity({required this.refreshToken, required this.accessToken});
  @override
  List<Object?> get props => [refreshToken, accessToken];

}