import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_backend/di.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await sl.reset();
  await sl.init();
}
