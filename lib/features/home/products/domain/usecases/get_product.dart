
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:fe_nike/features/home/products/domain/reponsitory/product_repository.dart';

class GetProductUseCase extends UseCase<DataState<List<ProductEntity>>, void>{

  final ProductRepository _productRepository;
  GetProductUseCase(this._productRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getProduct();
  }
  
}