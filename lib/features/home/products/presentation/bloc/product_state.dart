import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';

abstract class ProductState extends Equatable{

  final List<ProductEntity>? product ;
  final DioException ? error;

  const ProductState({this.product, this.error});

  @override
  List<Object?> get props => [{product, error}];
}

class ProductDone extends ProductState{
  const ProductDone(List<ProductEntity>product) : super(product: product);
}

class ProductLoading extends ProductState{
  const ProductLoading();
}

class ProductError extends ProductState{
  const ProductError(DioException error) : super(error: error);
}