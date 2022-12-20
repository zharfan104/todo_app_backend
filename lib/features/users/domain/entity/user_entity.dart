import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] as int?,
      name: json['name'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  final int? id;
  final String name;
  final int age;
  final String email;
  final String password;

  @override
  List<Object?> get props => [id, name, age, email, password];
}
