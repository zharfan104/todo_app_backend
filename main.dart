import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/di.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  configureDependencies();

  return serve(handler, ip, port);
}
