import 'package:food_delivery/screens/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthService {
  AuthService(this._authRepository);
  final AuthRepository _authRepository;

  Future<void> registerAUsers(
      String username, String email, String password) async {
    await _authRepository.registerAUsers(username, email, password);
  }

  Future<void> authorizationUser(String username, String password) async {
    await _authRepository.authorizationUser(username, password);
  }

  Future<bool> inLoggedIn() async {
    return await _authRepository.inLoggedIn();
  }

  Future<void> logOut() async {
    _authRepository.logOut();
  }
}
