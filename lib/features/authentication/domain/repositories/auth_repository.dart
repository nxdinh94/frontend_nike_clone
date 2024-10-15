

import 'package:fe_nike/core/resources/data_state.dart';
import 'package:fe_nike/features/authentication/domain/entities/token.dart';

import '../../data/data_sources/auth_services.dart';
import '../../data/model/logout_model.dart';
import '../entities/logout_entity.dart';

abstract class AuthRepository{
  Future<DataState<TokenEntity>> login(BodyLogin bodyLogin);

  Future<DataState<LogoutEntity>> logout(BodyLogout bodyLogout);
}