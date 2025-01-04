import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/change_favorite_product/domain/entities/change_favorite_state_entity.dart';

abstract class ChangeFavoriteStateRepository{
  Future<DataState<ChangeFavoriteStateEntity>> changeFavorite (String productId);
  Future<DataState<ChangeFavoriteStateEntity>> getIsFavorite (String productId);
}