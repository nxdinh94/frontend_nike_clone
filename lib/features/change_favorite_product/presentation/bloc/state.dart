
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class GetFavoriteState extends Equatable{

  final bool ? isFavorite ;
  final DioException ? error;

  const GetFavoriteState({this.isFavorite, this.error});

  @override
  List<Object?> get props => [isFavorite, error];
}

class GetFavoriteStateLoading extends GetFavoriteState {
    const GetFavoriteStateLoading();
}

class GetFavoriteStateSuccess extends GetFavoriteState{
  const GetFavoriteStateSuccess(bool isFavorite) : super(isFavorite: isFavorite);
}

class GetFavoriteStateFail extends GetFavoriteState{
  const GetFavoriteStateFail(DioException error) : super(error: error);
}