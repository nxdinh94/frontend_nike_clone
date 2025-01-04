
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/change_favorite_product/data/data_sources/change_favorite_state_service.dart';
import 'package:fe_nike/features/change_favorite_product/domain/entities/change_favorite_state_entity.dart';
import 'package:fe_nike/features/change_favorite_product/domain/repository/detail_product_repos.dart';

class ChangeFavoriteStateRepoImp extends ChangeFavoriteStateRepository{

  final ChangeFavoriteStateService _changeFavoriteStateService;
  ChangeFavoriteStateRepoImp(this._changeFavoriteStateService);

  @override
  Future<DataState<ChangeFavoriteStateEntity>> changeFavorite(String productId)async {
    try{
      final httpResponse = await _changeFavoriteStateService.changeFavorite(productId);

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

  @override
  Future<DataState<ChangeFavoriteStateEntity>> getIsFavorite(String productId) async {
    try{
      final httpResponse = await _changeFavoriteStateService.getFavorite(productId);

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