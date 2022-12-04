import 'package:postgres/postgres.dart';

// ignore: public_member_api_docs
class DatabaseConfig {
  PostgreSQLConnection? _database;

  // ignore: public_member_api_docs
  Future<PostgreSQLConnection> getConnection() async {
    if (_database == null) {
      _database = PostgreSQLConnection(
        'localhost',
        5432,
        'todoapp',
        username: 'no_one',
        password: 'no_one',
      );
      await _database!.open();
    }
    return _database!;
  }
}
