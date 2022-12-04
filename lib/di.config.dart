// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:postgres/postgres.dart' as _i4;
import 'package:todo_app_backend/core/config/database_config.dart' as _i5;
import 'package:todo_app_backend/core/jwt/jwt_service.dart' as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.JwtService>(_i3.JwtServiceImpl());
    await gh.factoryAsync<_i4.PostgreSQLConnection>(
      () => registerModule.database(),
      preResolve: true,
    );
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
