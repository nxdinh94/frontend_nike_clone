
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';

abstract class FavoriteProductRepo {
  Future<DataState<List<FavoriteProductEntity>>> getFavoriteProduct();
}