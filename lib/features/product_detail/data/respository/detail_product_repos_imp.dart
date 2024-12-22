
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/product_detail/data/data_sources/detail_product_service.dart';
import 'package:fe_nike/features/product_detail/domain/entities/change_favorite_entity.dart';
import 'package:fe_nike/features/product_detail/domain/respository/detail_product_repos.dart';

class DetailProductRepoImp extends DetailProductRepository{

  final DetailProductService _detailProductService;
  DetailProductRepoImp(this._detailProductService);

  @override
  Future<DataState<ChangeFavoriteEntity>> changeFavorite(String productId)async {
    try{
      final httpResponse = await _detailProductService.changeFavorite(productId);

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
  Future<DataState<ChangeFavoriteEntity>> getIsFavorite(String productId) async {
    try{
      final httpResponse = await _detailProductService.getFavorite(productId);

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