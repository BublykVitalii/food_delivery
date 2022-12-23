import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/home/domaine/food.dart';
import 'package:food_delivery/screens/home/domaine/food_service.dart';
import 'package:get_it/get_it.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  final foodService = GetIt.instance.get<FoodService>();

  // void addToShoppingCart(int id) async {
  //   try {
  //     final product = await foodService.getProduct(id);
  //     final List<Food> listFoods = state.foods;
  //     listFoods.add(product!);

  //     emit(state.copyWith(
  //       status: CartStatus.success,
  //       foods: listFoods,
  //     ));
  //   } catch (error) {
  //     emit(state.copyWith(
  //       status: CartStatus.error,
  //       errorMessage: error.toString(),
  //     ));
  //   }
  // }

  void getShopProducts() async {
    try {
      emit(state.copyWith(
        status: CartStatus.success,
        foods: state.foods,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: CartStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
