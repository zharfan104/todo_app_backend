import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
  });

  final int? id;
  final String name;
  final int age;
  final String email;
  final String password;

  @override
  List<Object?> get props => [id, name, age, email, password];
}
