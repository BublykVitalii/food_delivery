import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/home/domaine/food.dart';
import 'package:food_delivery/screens/home/domaine/food_service.dart';
import 'package:get_it/get_it.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  final foodService = GetIt.instance.get<FoodService>();

  Future<void> getFoods() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final foods = await foodService.getFoods();
      emit(state.copyWith(
        status: HomeStatus.success,
        foods: foods,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> getCategories(String category) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final foods = await foodService.getCategories(category);
      emit(state.copyWith(
        status: HomeStatus.success,
        foods: foods,
        category: category,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
