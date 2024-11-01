
import 'package:equatable/equatable.dart';

class MeEntity extends Equatable{
  final int ? id;
  final String ?  name;
  final String ?  email;
  final int ?  role;
  final String ?  bio;
  final String  ? dob;
  final String ?  country;
  final String ?  shipAddress;
  final String ?  paymentInfo;
  final String ?  language;
  const MeEntity({
    this.id,
    this.name,
    this.email,
    this.role,
    this.bio,
    this.dob,
    this.country,
    this.shipAddress,
    this.paymentInfo,
    this.language
  });

  @override
  List<Object?> get props => [
    id, name, email, role, bio, dob, country, shipAddress, paymentInfo, language
  ];
}