import 'package:food_delivery/screens/home/domaine/food.dart';
import 'package:food_delivery/screens/home/domaine/food_repository.dart';

import 'package:injectable/injectable.dart';

enum FoodsCategory {
  foods,
  drinks,
  snacks,
  sauces,
  salads,
}

@singleton
class FoodService {
  FoodService(this._foodRepository);

  final FoodRepository _foodRepository;

  List<Food>? _foods;
  List<Food>? get foods => _foods;

  Future<List<Food>?> getFoods() async {
    _foods = await _foodRepository.getFoods();
    return _foods;
  }

  Future<List<Food>?> getCategories(String category) async {
    _foods = await _foodRepository.getCategories(category);
    return _foods;
  }
}
