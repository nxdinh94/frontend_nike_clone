sealed class ChangeFavoriteStateEvent {}

class ChangeFavoriteState extends ChangeFavoriteStateEvent{
  final String productId;
  ChangeFavoriteState({required this.productId});
}
class GetFavorite extends ChangeFavoriteStateEvent{
  final String productId;
  GetFavorite({required this.productId});
}
