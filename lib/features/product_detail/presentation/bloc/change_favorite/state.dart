
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class GetFavoriteState extends Equatable{

  final bool ? isFavorite ;
  final DioException ? error;

  const GetFavoriteState({this.isFavorite, this.error});

  @override
  List<Object?> get props => [isFavorite, error];
}

class GetFavoriteLoading extends GetFavoriteState {
    const GetFavoriteLoading();
}

class GetFavoriteSuccess extends GetFavoriteState{
  const GetFavoriteSuccess(bool isFavorite) : super(isFavorite: isFavorite);
}

class GetFavoriteFail extends GetFavoriteState{
  const GetFavoriteFail(DioException error) : super(error: error);
}