import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/home/domaine/food.dart';
import 'package:food_delivery/screens/home/domaine/food_service.dart';
import 'package:get_it/get_it.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  final foodService = GetIt.instance.get<FoodService>();

  Future<void> getCategories(String category) async {
    emit(state.copyWith(status: SearchStatus.loading));
    try {
      final foods = await foodService.getCategories(category);
      emit(state.copyWith(
        status: SearchStatus.success,
        foods: foods,
        category: category,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SearchStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
