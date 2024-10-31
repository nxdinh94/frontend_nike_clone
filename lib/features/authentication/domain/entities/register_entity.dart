
import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{

  final String message;
  const RegisterEntity({
    required this.message
  });

  @override
  List<Object?> get props => [message];

}