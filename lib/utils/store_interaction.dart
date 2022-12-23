import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class StoreInteraction {
  Future<void> setUserToken(String? userToken) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString('jwt', userToken ?? 'token');
  }

  Future<String?> getUserToken() async {
    final preference = await SharedPreferences.getInstance();
    final String? userToken = preference.getString('jwt');
    return userToken;
  }

  Future<void> removeUserToken() async {
    final preference = await SharedPreferences.getInstance();
    await preference.remove('jwt');
  }
}
