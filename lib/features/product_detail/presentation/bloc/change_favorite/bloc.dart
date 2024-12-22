
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/product_detail/domain/usecases/change_favorite_usecase.dart';
import 'package:fe_nike/features/product_detail/domain/usecases/get_favorite_usecase.dart';
import 'package:fe_nike/features/product_detail/presentation/bloc/change_favorite/event.dart';
import 'package:fe_nike/features/product_detail/presentation/bloc/change_favorite/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavoriteBloc extends Bloc<ChangeFavoriteEvent, GetFavoriteState>{

  final ChangeFavoriteUseCase _changeFavoriteUseCase;
  final GetFavoriteUsecase _getFavoriteUsecase;

  GetFavoriteBloc(this._changeFavoriteUseCase, this._getFavoriteUsecase): super(const GetFavoriteLoading()){
    on<ChangeFavorite>(_onChangeFavorite);
    on<GetFavorite>(_onGetFavorite);
  }

  Future<void> _onChangeFavorite(ChangeFavorite event, Emitter<GetFavoriteState> emit)async{
    final result = await _changeFavoriteUseCase(params: event.productId);
    // If result is success, call api to get favorite state then emit
    if(result is DataSuccess){
      final getFavorite = await _getFavoriteUsecase(params: event.productId);
      emit(GetFavoriteSuccess(getFavorite.data!.isFavorite));
    }
    if(result is DataError){
      emit(GetFavoriteFail(result.error!));
    }
  }
  Future<void> _onGetFavorite(GetFavorite event, Emitter<GetFavoriteState> emit)async{
    final result = await _getFavoriteUsecase(params: event.productId);
    if(result is DataSuccess){
      emit(GetFavoriteSuccess(result.data!.isFavorite));
    }
    if(result is DataError){
      emit(GetFavoriteFail(result.error!));
    }
  }
}
