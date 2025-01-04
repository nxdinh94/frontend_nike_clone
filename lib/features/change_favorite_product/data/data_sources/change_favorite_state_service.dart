
import 'package:fe_nike/core/constants/queries.dart';
import 'package:fe_nike/features/change_favorite_product/data/model/change_favorite_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;



part 'change_favorite_state_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ChangeFavoriteStateService{
  factory ChangeFavoriteStateService(Dio dio, {String? baseUrl}) = _ChangeFavoriteStateService;

  @POST('/users/favorite/{productId}')
  Future<HttpResponse<ChangeFavoriteStateModel>> changeFavorite(@Path() String productId);

  @GET('/users/favorite/{productId}')
  Future<HttpResponse<ChangeFavoriteStateModel>> getFavorite(@Path() String productId);
}
