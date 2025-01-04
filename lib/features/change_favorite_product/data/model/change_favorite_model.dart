

import 'package:fe_nike/features/change_favorite_product/domain/entities/change_favorite_state_entity.dart';

class ChangeFavoriteStateModel extends ChangeFavoriteStateEntity{

  const ChangeFavoriteStateModel({required super.isFavorite});

  factory ChangeFavoriteStateModel.fromJson(Map<String, dynamic> map){
    return ChangeFavoriteStateModel(isFavorite: map["data"] ?? false);
  }

  factory ChangeFavoriteStateModel.fromEntity(ChangeFavoriteStateEntity entity){
    return ChangeFavoriteStateModel(isFavorite: entity.isFavorite);
  }

}