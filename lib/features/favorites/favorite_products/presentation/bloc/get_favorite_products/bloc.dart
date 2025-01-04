

import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/usecase/get_favorite_product_usecases.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/get_favorite_products/event.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/get_favorite_products/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteProductBloc extends Bloc<FavoriteProductEvent, FavoriteProductState>{

  final GetFavoriteProductUseCase _getFavoriteProductUseCase;

  FavoriteProductBloc(this._getFavoriteProductUseCase): super(const GetFavoriteProductLoading()){
    on<GetFavoriteProduct>(_onGetFavoriteProduct);
  }

  Future<void> _onGetFavoriteProduct (FavoriteProductEvent event, Emitter<FavoriteProductState> emit)async{
    final dataState = await _getFavoriteProductUseCase();
    if(dataState is DataSuccess){
      emit( GetFavoriteProductDone(dataState.data!));
    }
    if(dataState is DataError){
      emit(GetFavoriteProductError(dataState.error!));
    }
  }


}