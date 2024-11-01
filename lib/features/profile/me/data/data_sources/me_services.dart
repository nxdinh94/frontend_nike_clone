
import 'package:dio/dio.dart';
import 'package:fe_nike/features/profile/me/data/model/me_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/queries.dart';

part 'me_services.g.dart';  // Add this line to include the generated file

@RestApi(baseUrl: baseUrl)
abstract class MeServices {
  factory MeServices(Dio dio, {String? baseUrl}) = _MeServices; // This will be auto-generated

  @GET('/users/me')
  Future<HttpResponse<MeModel>> getMe();
}
