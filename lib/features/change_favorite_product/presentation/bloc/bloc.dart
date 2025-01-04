
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/change_favorite_product/domain/use_cases/change_favorite_state_usecase.dart';
import 'package:fe_nike/features/change_favorite_product/domain/use_cases/get_favorite_state_usecase.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/event.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavoriteStateBloc extends Bloc<ChangeFavoriteStateEvent, GetFavoriteState>{

  final ChangeFavoriteStateUseCase _changeFavoriteUseCase;
  final GetFavoriteStateUseCase _getFavoriteUseCase;

  GetFavoriteStateBloc(this._changeFavoriteUseCase, this._getFavoriteUseCase): super(const GetFavoriteStateLoading()){
    on<ChangeFavoriteState>(_onChangeFavorite);
    on<GetFavorite>(_onGetFavorite);
  }

  Future<void> _onChangeFavorite(ChangeFavoriteState event, Emitter<GetFavoriteState> emit)async{
    final result = await _changeFavoriteUseCase(params: event.productId);
    // If result is success, call api to get favorite state then emit
    if(result is DataSuccess){
      final getFavorite = await _getFavoriteUseCase(params: event.productId);
      emit(GetFavoriteStateSuccess(getFavorite.data!.isFavorite));
    }
    if(result is DataError){
      emit(GetFavoriteStateFail(result.error!));
    }
  }
  Future<void> _onGetFavorite(GetFavorite event, Emitter<GetFavoriteState> emit)async{
    final result = await _getFavoriteUseCase(params: event.productId);
    if(result is DataSuccess){
      emit(GetFavoriteStateSuccess(result.data!.isFavorite));
    }
    if(result is DataError){
      emit(GetFavoriteStateFail(result.error!));
    }
  }
}
