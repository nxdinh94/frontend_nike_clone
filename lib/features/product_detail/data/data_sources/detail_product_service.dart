
import 'package:fe_nike/core/constants/queries.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../model/change_favorite_model.dart';


part 'detail_product_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DetailProductService{
  factory DetailProductService(Dio dio, {String? baseUrl}) = _DetailProductService;

  @POST('/users/favorite/{productId}')
  Future<HttpResponse<ChangeFavoriteModel>> changeFavorite(@Path() String productId);

  @GET('/users/favorite/{productId}')
  Future<HttpResponse<ChangeFavoriteModel>> getFavorite(@Path() String productId);
}
