sealed class ChangeFavoriteEvent {}

class ChangeFavorite extends ChangeFavoriteEvent{
  final String productId;
  ChangeFavorite({required this.productId});
}
class GetFavorite extends ChangeFavoriteEvent{
  final String productId;
  GetFavorite({required this.productId});
}
