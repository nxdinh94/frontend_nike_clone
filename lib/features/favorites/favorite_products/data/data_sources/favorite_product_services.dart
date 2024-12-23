

import 'package:dio/dio.dart';
import 'package:fe_nike/core/constants/queries.dart';
import 'package:fe_nike/features/favorites/favorite_products/data/model/favorite_product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'favorite_product_services.g.dart';  // Add this line to include the generated file

@RestApi(baseUrl: baseUrl)
abstract class FavoriteProductServices {
  factory FavoriteProductServices(Dio dio, {String? baseUrl}) = _FavoriteProductServices; // This will be auto-generated

  @GET('/users/product/favorite')
  Future<HttpResponse<List<FavoriteProductModel>>> getFavoriteProducts();
}
