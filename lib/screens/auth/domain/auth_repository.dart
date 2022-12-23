abstract class AuthRepository {
  Future<void> registerAUsers(String username, String email, String password);
  Future<void> authorizationUser(String username, String password);
  Future<bool> inLoggedIn();
  Future<void> logOut();
}
