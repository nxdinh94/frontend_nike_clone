
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable{

  final bool ? isFavorite ;
  final DioException ? error;

  const FavoriteState({this.isFavorite, this.error});

  @override
  List<Object?> get props => [isFavorite, error];
}

class GetFavoriteStateLoading extends FavoriteState {
    const GetFavoriteStateLoading();
}

class GetFavoriteStateSuccess extends FavoriteState{
  const GetFavoriteStateSuccess(bool isFavorite) : super(isFavorite: isFavorite);
}

class GetFavoriteStateFail extends FavoriteState{
  const GetFavoriteStateFail(DioException error) : super(error: error);
}