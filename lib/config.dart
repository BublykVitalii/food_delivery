import 'package:injectable/injectable.dart';

@singleton
class AppConfig {
  static const _baseUrl = 'https://rn-food-delivery.herokuapp.com/api';
  String get baseUrl => _baseUrl;
  AppConfig();
}
