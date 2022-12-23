part of 'cart_cubit.dart';

enum CartStatus {
  initial,
  loading,
  success,
  error,
}

class CartState {
  final CartStatus status;
  final List<Food> foods;
  final String? errorMessage;
  final String? category;

  CartState({
    this.errorMessage,
    this.foods = const <Food>[],
    this.status = CartStatus.initial,
    this.category,
  });

  CartState copyWith({
    CartStatus? status,
    List<Food>? foods,
    String? errorMessage,
    String? category,
  }) {
    return CartState(
      status: status ?? this.status,
      foods: foods ?? this.foods,
      errorMessage: errorMessage ?? this.errorMessage,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'SearchState {  status: $status, foods: $foods, errorMessage: $errorMessage, category: $category,';
  }

  List<Object?> get props => [
        status,
        foods,
        errorMessage,
        category,
      ];
}
