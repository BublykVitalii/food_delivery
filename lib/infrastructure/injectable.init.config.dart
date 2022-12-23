// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config.dart' as _i3;
import '../screens/auth/api/http_auth.repository.dart' as _i10;
import '../screens/auth/domain/auth_repository.dart' as _i9;
import '../screens/auth/domain/auth_service.dart' as _i11;
import '../screens/home/api/http_food_repository.dart' as _i6;
import '../screens/home/domaine/food_repository.dart' as _i5;
import '../screens/home/domaine/food_service.dart' as _i7;
import '../utils/store_interaction.dart' as _i8;
import 'api_client.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioRegisterModule = _$DioRegisterModule();
  gh.singleton<_i3.AppConfig>(_i3.AppConfig());
  gh.singleton<_i4.Dio>(dioRegisterModule.registerClient(get<_i3.AppConfig>()));
  gh.singleton<_i5.FoodRepository>(_i6.HttpFoodRepository(get<_i4.Dio>()));
  gh.singleton<_i7.FoodService>(_i7.FoodService(get<_i5.FoodRepository>()));
  gh.singleton<_i8.StoreInteraction>(_i8.StoreInteraction());
  gh.singleton<_i9.AuthRepository>(_i10.HttpAuthRepository(
    get<_i4.Dio>(),
    get<_i8.StoreInteraction>(),
  ));
  gh.singleton<_i11.AuthService>(_i11.AuthService(get<_i9.AuthRepository>()));
  return get;
}

class _$DioRegisterModule extends _i12.DioRegisterModule {}
