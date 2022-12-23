part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  error,
}

class SearchState {
  final SearchStatus status;
  final List<Food> foods;
  final String? errorMessage;
  final String? category;

  SearchState({
    this.errorMessage,
    this.foods = const <Food>[],
    this.status = SearchStatus.initial,
    this.category,
  });

  SearchState copyWith({
    SearchStatus? status,
    List<Food>? foods,
    String? errorMessage,
    String? category,
  }) {
    return SearchState(
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
