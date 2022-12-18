import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<PostgreSQLConnection> database() async {
    final database = getProdConnection();

    await database.open();

    return database;
  }

  PostgreSQLConnection getProdConnection() {
    final connectionName = Platform.environment['CLOUD_SQL_CONNECTION_NAME']!;
    final databaseName = Platform.environment['DB_NAME']!;
    final user = Platform.environment['DB_USER']!;
    final password = Platform.environment['DB_PASS']!;
    final socketPath = '/cloudsql/$connectionName/.s.PGSQL.5432';

    return PostgreSQLConnection(
      socketPath,
      5432,
      databaseName,
      username: user,
      password: password,
      isUnixSocket: true,
    );
  }
}
