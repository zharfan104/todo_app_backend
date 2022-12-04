import 'package:todo_app_backend/features/users/data/models/user_model.dart';
import 'package:todo_app_backend/features/users/data/repositories/user_repository_impl.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository userRepository = UserRepositoryImpl();

  Future<List<UserModel>> call() async {
    final users = await userRepository.getAllUsers();
    return users;
  }
}
