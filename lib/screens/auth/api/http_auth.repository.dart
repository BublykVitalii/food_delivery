import 'package:dio/dio.dart';
import 'package:food_delivery/utils/store_interaction.dart';
import 'package:injectable/injectable.dart';

import 'package:food_delivery/screens/auth/domain/auth_exceptions.dart';
import 'package:food_delivery/screens/auth/domain/auth_repository.dart';

import 'package:food_delivery/screens/auth/api/client/auth_api.dart';
import 'package:food_delivery/screens/auth/api/dto/auth_data_dto.dart';
import 'package:food_delivery/screens/auth/api/dto/auth_dto.dart';

@Singleton(as: AuthRepository)
class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository(this._dio, this._preference);

  final Dio _dio;
  final StoreInteraction _preference;

  @override
  Future<void> registerAUsers(
    String username,
    String email,
    String password,
  ) async {
    try {
      final authDTO = AuthDTO(
        username: username,
        email: email,
        password: password,
      );

      final response = await _dio.post(
        AuthApiClient.register,
        data: authDTO.toJson(),
      );

      final authDataDTO = AuthDataDTO.fromJson(response.data);
      final token = authDataDTO.token;

      _preference.setUserToken(token);
    } on DioError catch (error) {
      if (error.response != null && error.response!.statusCode == 400) {
        throw const WrongRegistrationException();
      }
      if (error.response != null && error.response!.statusCode == 401) {
        throw const WrongCredentialsException();
      }
      if (error.response != null && error.response!.statusCode == 404) {
        throw const WrongLinkException();
      }

      rethrow;
    }
  }

  @override
  Future<void> authorizationUser(String username, String password) async {
    try {
      final authDTO = AuthDTO(
        identifier: username,
        password: password,
      );

      final response =
          await _dio.post(AuthApiClient.authUser, data: authDTO.toJson());

      final authDataDTO = AuthDataDTO.fromJson(response.data);
      final token = authDataDTO.token;

      _preference.setUserToken(token);
    } on DioError catch (error) {
      if (error.response != null && error.response!.statusCode == 400) {
        throw const WrongLoginDataException();
      }
      if (error.response != null && error.response!.statusCode == 401) {
        throw const WrongLoginDataException();
      }
      if (error.response != null && error.response!.statusCode == 404) {
        throw const WrongLoginDataException();
      }
      rethrow;
    }
  }

  @override
  Future<bool> inLoggedIn() async {
    final userToken = await _preference.getUserToken();
    return userToken != null;
  }

  @override
  Future<void> logOut() async {
    await _preference.removeUserToken();
  }
}
