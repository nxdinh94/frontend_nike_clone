import 'package:equatable/equatable.dart';

class ChangeFavoriteEntity extends Equatable{
  final bool isFavorite;
  const ChangeFavoriteEntity({required this.isFavorite});

  @override
  List<Object?> get props => [isFavorite];
}