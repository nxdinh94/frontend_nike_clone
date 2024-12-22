
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/product_detail/domain/entities/change_favorite_entity.dart';
import 'package:fe_nike/features/product_detail/domain/respository/detail_product_repos.dart';

class ChangeFavoriteUseCase extends UseCase<DataState<ChangeFavoriteEntity>, String>{

  final DetailProductRepository _detailProductRepository;
  ChangeFavoriteUseCase(this._detailProductRepository);

  @override
  Future<DataState<ChangeFavoriteEntity>> call({String ? params}) {
    return _detailProductRepository.changeFavorite(params!);
  }
}