
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fe_nike/features/authentication/domain/entities/token.dart';

abstract class AuthState  extends Equatable{
  final TokenEntity ? token ;
  final DioException ? error;

  const AuthState({this.token, this.error});

  @override
  List<Object?> get props => [token, error];
}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  const AuthErrorState(DioException error) : super(error: error);
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState(TokenEntity token): super(token: token);
}