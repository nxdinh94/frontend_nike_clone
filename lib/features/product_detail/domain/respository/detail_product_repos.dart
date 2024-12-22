import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/product_detail/domain/entities/change_favorite_entity.dart';

abstract class DetailProductRepository{
  Future<DataState<ChangeFavoriteEntity>> changeFavorite (String productId);
  Future<DataState<ChangeFavoriteEntity>> getIsFavorite (String productId);
}