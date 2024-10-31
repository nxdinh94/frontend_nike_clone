

import 'package:fe_nike/features/authentication/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity{
  const RegisterModel({
    required super.message
  });

  factory RegisterModel.fromJson(Map<String, dynamic>map){
    return RegisterModel(
      message: map['message'] as String
    );
  }
  factory RegisterModel.fromEntity(RegisterModel entity){
    return RegisterModel(
      message: entity.message
    );
  }
}