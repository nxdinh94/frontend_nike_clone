import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/home/products/domain/usecases/get_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_event.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{

  final GetProductUseCase _getProductUseCase;

  ProductBloc(this._getProductUseCase) :super(const ProductLoading()){
    on<GetProduct>(onGetProduct);
  }
  Future<void> onGetProduct(ProductEvent event, Emitter<ProductState> emit)async{
    final dataState = await _getProductUseCase();
    if(dataState is DataSuccess){
      emit(ProductDone(dataState.data!));
    }
    if(dataState is DataError){
      emit(ProductError(dataState.error!));
    }
  }
}