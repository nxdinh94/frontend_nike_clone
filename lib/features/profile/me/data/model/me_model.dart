
import 'package:fe_nike/features/profile/me/domain/entities/me_entity.dart';

class MeModel extends MeEntity{
  const MeModel({
    super.id,
    super.name,
    super.email,
    super.role,
    super.bio,
    super.dob,
    super.country,
    super.shipAddress,
    super.paymentInfo,
    super.language,
  });
  factory MeModel.fromJson(Map<String, dynamic> user){
    return MeModel(
      id: user['id'] ?? 0,
      name: user['name'] ?? "",
      email: user['email']?? "",
      role: user['role']?? 0,
      bio: user['bio']?? "",
      dob: user['dob']?? "",
      country: user['country']?? "",
      shipAddress: user['shipAddress']?? "",
      paymentInfo: user['paymentInfo']?? "",
      language: user['language']?? ""
    );
  }
  factory MeModel.fromEntity(MeEntity meEntity){
    return MeModel(
      id: meEntity.id,
      name: meEntity.name,
      email: meEntity.email,
      role: meEntity.role,
      bio: meEntity.bio,
      dob: meEntity.dob,
      country: meEntity.country,
      shipAddress: meEntity.shipAddress,
      paymentInfo: meEntity.paymentInfo,
      language: meEntity.language,
    );
  }
}