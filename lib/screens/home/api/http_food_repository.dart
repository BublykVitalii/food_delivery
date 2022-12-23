import 'package:dio/dio.dart';
import 'package:food_delivery/screens/home/api/dto/category_dto.dart';

import 'package:injectable/injectable.dart';

import 'package:food_delivery/screens/auth/domain/auth_exceptions.dart';
import 'package:food_delivery/screens/home/api/client/foods_api.dart';
import 'package:food_delivery/screens/home/api/dto/foods_dto.dart';
import 'package:food_delivery/screens/home/domaine/food.dart';
import 'package:food_delivery/screens/home/domaine/food_repository.dart';

@Singleton(as: FoodRepository)
class HttpFoodRepository implements FoodRepository {
  HttpFoodRepository(this._dio);

  final Dio _dio;

  @override
  Future<List<Food>> getFoods() async {
    try {
      final response = await _dio.get(FoodsApi.foods);

      final foodsDTO = FoodsDTO.fromJson(response.data);
      return foodsDTO.toFoods();
    } on DioError catch (error) {
      if (error.response == null) {
        throw const WrongRegistrationException();
      }
      rethrow;
    }
  }

  @override
  Future<List<Food>> getCategories(String category) async {
    try {
      final response = await _dio.get(FoodsApi.categories,
          queryParameters: ({'filters[categories][name]': category}));

      final foodsDTO = CategoryFoodsDTO.fromJson(response.data);
      return foodsDTO.toFoods();
    } on DioError catch (error) {
      if (error.response == null) {
        throw const WrongRegistrationException();
      }
      rethrow;
    }
  }
}
