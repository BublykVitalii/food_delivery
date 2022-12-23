import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:food_delivery/utils/store_interaction.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:food_delivery/config.dart';

class FlutterTransformer extends DefaultTransformer {
  static dynamic _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static Future _parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  FlutterTransformer() : super(jsonDecodeCallback: _parseJson);
}

@module
abstract class DioRegisterModule {
  @singleton
  Dio registerClient(AppConfig config) {
    return Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
      ),
    )
      ..transformer = FlutterTransformer()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: _requestInterceptor,
        ),
      );
  }
}

void _requestInterceptor(
    RequestOptions options, RequestInterceptorHandler handler) async {
  final StoreInteraction _pref = GetIt.instance.get<StoreInteraction>();
  final token = await _pref.getUserToken();
  if (token != null) {
    handler.next(options);
    return options.headers.addAll({'Authorization': 'Bearer $token'});
  }
  handler.next(options);
}
