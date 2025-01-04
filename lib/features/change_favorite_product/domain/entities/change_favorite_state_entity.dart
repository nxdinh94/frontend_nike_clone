import 'package:equatable/equatable.dart';

class ChangeFavoriteStateEntity extends Equatable{
  final bool isFavorite;
  const ChangeFavoriteStateEntity({required this.isFavorite});

  @override
  List<Object?> get props => [isFavorite];
}