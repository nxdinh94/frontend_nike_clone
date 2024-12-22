
import 'package:fe_nike/features/product_detail/domain/entities/change_favorite_entity.dart';

class ChangeFavoriteModel extends ChangeFavoriteEntity{

  const ChangeFavoriteModel({required super.isFavorite});

  factory ChangeFavoriteModel.fromJson(Map<String, dynamic> map){
    return ChangeFavoriteModel(isFavorite: map["data"]);
  }

  factory ChangeFavoriteModel.fromEntity(ChangeFavoriteEntity entity){
    return ChangeFavoriteModel(isFavorite: entity.isFavorite);
  }

}