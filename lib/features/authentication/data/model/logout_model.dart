
import 'package:fe_nike/features/authentication/domain/entities/logout_entity.dart';

class LogoutModel extends LogoutEntity{
  const LogoutModel({required super.message});

  factory LogoutModel.fromJson(Map<String, dynamic>map) {
    return LogoutModel(message: map['message']);
  }

  factory LogoutModel.fromEntity(LogoutEntity logoutEntity){
    return LogoutModel(message: logoutEntity.message);
  }
}