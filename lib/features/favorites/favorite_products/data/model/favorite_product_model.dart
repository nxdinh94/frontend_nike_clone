

import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';

class FavoriteProductModel extends FavoriteProductEntity{
  const FavoriteProductModel({
    super.id,
    super.name,
    super.subtitle,
    super.isFavorite,
    super.brand,
    super.price,
    super.description,
    super.howItMade,
    super.imageList,
    super.collection,
    super.gender,
    super.style,
    super.material,
    super.color,
    super.thumbnail,
    super.styleCode,
    super.country,
  });
  factory FavoriteProductModel.fromJson(Map < String, dynamic > map){
    return FavoriteProductModel(
      id: map['id']?? 0,
      name: map['name'] ?? "",
      subtitle: map['subtitle'] ?? "",
      brand: map['brand'] ?? "",
      isFavorite: map['isFavorite'] ?? true,
      price: map['price'] ?? 0,
      description: map['description'] ?? "",
      howItMade: map['howItMade'] ?? [''], // Cast to List<String>
      imageList: map['image'] ?? [''], // Cast to List<String>
      collection: map['collection'] ?? "",
      gender: map['gender'] ?? "",
      style: map['style'] ?? "",
      material: map['material'] ?? "",
      color: map['color'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      styleCode: map['styleCode'] ?? "",
      country: map['country'] ?? "",
    );
  }
  factory FavoriteProductModel.fromEntity(FavoriteProductEntity entity){
    return FavoriteProductModel(
      id: entity.id,
      name: entity.name,
      subtitle: entity.subtitle,
      brand: entity.brand,
      isFavorite: entity.isFavorite,
      price: entity.price,
      description: entity.description,
      howItMade: entity.howItMade, // Cast to List<String>
      imageList: entity.imageList, // Cast to List<String>
      collection: entity.collection,
      gender: entity.gender,
      style: entity.style,
      material: entity.material,
      color: entity.color,
      thumbnail: entity.thumbnail,
      styleCode: entity.styleCode,
      country: entity.country,
    );
  }
}
