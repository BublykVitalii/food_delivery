part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState {
  final HomeStatus status;
  final List<Food> foods;
  final String? errorMessage;
  final String? category;

  HomeState({
    this.errorMessage,
    this.foods = const <Food>[],
    this.status = HomeStatus.initial,
    this.category,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<Food>? foods,
    String? errorMessage,
    String? category,
  }) {
    return HomeState(
      status: status ?? this.status,
      foods: foods ?? this.foods,
      errorMessage: errorMessage ?? this.errorMessage,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'HomeState {  status: $status, foods: $foods, errorMessage: $errorMessage, category: $category,';
  }

  List<Object?> get props => [
        status,
        foods,
        errorMessage,
        category,
      ];
}
