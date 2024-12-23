
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/repository/favorite_product_repo.dart';

class GetFavoriteProductUseCase extends UseCase<DataState<List<FavoriteProductEntity>>, void>{
  final FavoriteProductRepo _favoriteProductRepo;
  GetFavoriteProductUseCase(this._favoriteProductRepo);

  @override
  Future<DataState<List<FavoriteProductEntity>>> call({void params}) {
    return _favoriteProductRepo.getFavoriteProduct();
  }

}