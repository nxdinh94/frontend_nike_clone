

import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/change_favorite_product/domain/entities/change_favorite_state_entity.dart';
import 'package:fe_nike/features/change_favorite_product/domain/repository/detail_product_repos.dart';
class GetFavoriteStateUseCase extends UseCase<DataState<ChangeFavoriteStateEntity>, String>{

  final ChangeFavoriteStateRepository _detailProductRepository;
  GetFavoriteStateUseCase(this._detailProductRepository);

  @override
  Future<DataState<ChangeFavoriteStateEntity>> call({String ? params}) {
    return _detailProductRepository.getIsFavorite(params!);
  }
}