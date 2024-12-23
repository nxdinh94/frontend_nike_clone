
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/favorites/favorite_products/data/data_sources/favorite_product_services.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/repository/favorite_product_repo.dart';

class FavoriteProductRepoImp extends FavoriteProductRepo{
  final FavoriteProductServices _favoriteProductServices;
  FavoriteProductRepoImp(this._favoriteProductServices);
  @override
  Future<DataState<List<FavoriteProductEntity>>> getFavoriteProduct() async {
    try{
      final httpResponse = await _favoriteProductServices.getFavoriteProducts();
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