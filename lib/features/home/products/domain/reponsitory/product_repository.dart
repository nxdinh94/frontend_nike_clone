

import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';

abstract class ProductRepository{

  Future<DataState<List<ProductEntity>>> getProduct();

}