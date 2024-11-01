
import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/core/usecase/usecase.dart';
import 'package:fe_nike/features/profile/me/domain/entities/me_entity.dart';
import 'package:fe_nike/features/profile/me/domain/responsitory/me_reponsitory.dart';

class GetMeUseCases extends UseCase<DataState<MeEntity>, void>{

  final MeRepository _meRepository;
  GetMeUseCases(this._meRepository);

  @override
  Future<DataState<MeEntity>> call({void params}) {
    return _meRepository.getMe();
  }

}