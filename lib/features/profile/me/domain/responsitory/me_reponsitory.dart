import 'dart:io';

import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/profile/me/domain/entities/me_entity.dart';

abstract class MeRepository {

  Future<DataState<MeEntity>> getMe();

}