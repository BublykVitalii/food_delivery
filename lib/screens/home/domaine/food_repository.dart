import 'package:food_delivery/screens/home/domaine/food.dart';

abstract class FoodRepository {
  Future<List<Food>> getFoods();
  Future<List<Food>> getCategories(String category);
}
