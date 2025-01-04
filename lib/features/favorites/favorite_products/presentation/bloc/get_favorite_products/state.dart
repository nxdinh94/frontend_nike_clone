import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';

abstract class FavoriteProductState extends Equatable{

  final List<FavoriteProductEntity>? product ;
  final DioException ? error;

  const FavoriteProductState({this.product, this.error});

  @override
  List<Object?> get props => [{product, error}];
}

class GetFavoriteProductDone extends FavoriteProductState{
  const GetFavoriteProductDone(List<FavoriteProductEntity>product) : super(product: product);
}

class GetFavoriteProductLoading extends FavoriteProductState{
  const GetFavoriteProductLoading();
}

class GetFavoriteProductError extends FavoriteProductState{
  const GetFavoriteProductError(DioException error) : super(error: error);
}