
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/home/products/data/data_sources/product_services.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:fe_nike/features/home/products/domain/responsitory/product_repository.dart';

class ProductRepositoryImp extends ProductRepository{
  final ProductServices _productServices;
      ProductRepositoryImp(this._productServices);
      @override
      Future<DataState<List<ProductEntity>>> getProduct() async {
        try{
          final httpResponse = await _productServices.getProducts();

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