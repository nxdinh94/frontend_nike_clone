
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/profile/me/data/data_sources/me_services.dart';

import 'package:fe_nike/features/profile/me/domain/entities/me_entity.dart';

import '../../domain/responsitory/me_reponsitory.dart';

class MeRepositoryImp extends MeRepository{

  final MeServices _getMeService;
  MeRepositoryImp(this._getMeService);
  @override
  Future<DataState<MeEntity>> getMe() async{
    try{
      final httpResponse = await _getMeService.getMe();

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