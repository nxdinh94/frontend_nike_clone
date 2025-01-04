
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{

  final int ? id ;
  final String ? name ;
  final String ? subtitle ;
  final String? brand;
  final dynamic  price  ;
  final String ? description ;
  final List<dynamic> ? howItMade ;
  final Map<String, dynamic> ? imageList ;
  final String ? collection;
  final String ? gender ;
  final String ? style;
  final String ? material ;
  final String ? color ;
  final String ? thumbnail;
  final String ? styleCode ;
  final String ? country ;

  const ProductEntity({
    this.id,
    this.name,
    this.subtitle,
    this.brand,
    this.price,
    this.description,
    this.howItMade,
    this.imageList,
    this.collection,
    this.gender,
    this.style,
    this.material,
    this.color,
    this.thumbnail,
    this.styleCode,
    this.country,
  });
  @override
  List<Object?> get props => [
    id,
    name,
    subtitle,
    brand,
    price,
    description,
    howItMade,
    imageList,
    collection,
    gender,
    style,
    material,
    color,
    thumbnail,
    styleCode,
    country,
  ];

}
