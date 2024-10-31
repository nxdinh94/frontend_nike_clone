

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/domain/entities/logout_entity.dart';
import 'package:fe_nike/features/authentication/domain/entities/register_entity.dart';
import 'package:fe_nike/features/authentication/domain/entities/token.dart';
import 'package:fe_nike/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository{
  final AuthServices authServices;
  AuthRepositoryImp(this.authServices);

  @override
  Future<DataState<TokenEntity>> login(BodyLogin bodyLogin) async {
    try{
      final httpResponse = await authServices.login(bodyLogin);
      if(httpResponse.response.statusCode ==  HttpStatus.ok){
        return DataSuccess(httpResponse.data);
      }else{
        return DataError(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions
          )
        );
      }
    } on DioException catch(e){
      return DataError(e);
    }
  }

  @override
  Future<DataState<LogoutEntity>> logout(BodyLogout bodyLogout)  async {
    try{
      final httpResponse = await authServices.logout( bodyLogout);
      if(httpResponse.response.statusCode ==  HttpStatus.ok){
        return DataSuccess(httpResponse.data);
      }else{
        return DataError(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions
          )
        );
      }
    } on DioException catch(e){
      return DataError(e);
    }
  }

  @override
  Future<DataState<RegisterEntity>> register(BodyRegister bodyRegister) async {
    try{
      final httpResponse = await authServices.register(bodyRegister);
      if(httpResponse.response.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.data);
      }else {
        return DataError(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions
          )
        );
      }
    }on DioException catch(e){
      return DataError(e);
    }
  }

}