import 'package:equatable/equatable.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:food_delivery/screens/home/domaine/food_service.dart';

class Food extends Equatable {
  final String? name;
  final String? price;
  final int? id;
  final String? photo;
  final List<String>? gallery;

  const Food({
    this.name,
    this.price,
    this.id,
    this.photo,
    this.gallery,
  });

  @override
  List<Object?> get props => [
        name,
        price,
        id,
        photo,
        gallery,
      ];
}

extension FoodsCategoryX on AppLocalizations {
  String foodsCategory(FoodsCategory category) {
    switch (category) {
      case FoodsCategory.foods:
        return foods;
      case FoodsCategory.drinks:
        return drinks;
      case FoodsCategory.snacks:
        return snacks;
      case FoodsCategory.sauces:
        return sauce;
      case FoodsCategory.salads:
        return salads;
      default:
        return foods;
    }
  }
}
