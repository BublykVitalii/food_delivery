import 'package:food_delivery/screens/home/domaine/food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'foods_dto.g.dart';

@JsonSerializable()
class FoodsDTO {
  List<DataDTO> data;

  FoodsDTO({required this.data});

  Map<String, dynamic> toJson() => _$FoodsDTOToJson(this);

  factory FoodsDTO.fromJson(Map<String, dynamic> json) =>
      _$FoodsDTOFromJson(json);

  List<Food> toFoods() {
    return data.map((data) => data.toFood()).toList();
  }
}

@JsonSerializable()
class DataDTO {
  int? id;
  AttributesDTO? attributes;

  DataDTO({this.id, this.attributes});
  Map<String, dynamic> toJson() => _$DataDTOToJson(this);

  factory DataDTO.fromJson(Map<String, dynamic> json) =>
      _$DataDTOFromJson(json);

  Food toFood() {
    return Food(
      id: id,
      name: attributes?.name,
      price: attributes?.price.toString(),
      photo: attributes?.photo,
      gallery: attributes?.gallery,
    );
  }
}

@JsonSerializable()
class CategoriesDTO {
  List<DataDTO>? data;

  CategoriesDTO({this.data});

  Map<String, dynamic> toJson() => _$CategoriesDTOToJson(this);

  factory CategoriesDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDTOFromJson(json);
}

@JsonSerializable()
class AttributesDTO {
  String? name;
  double? price;
  String? photo;
  List<String>? gallery;
  CategoriesDTO? categories;

  AttributesDTO({
    this.name,
    this.price,
    this.photo,
    this.gallery,
    this.categories,
  });

  Map<String, dynamic> toJson() => _$AttributesDTOToJson(this);

  factory AttributesDTO.fromJson(Map<String, dynamic> json) =>
      _$AttributesDTOFromJson(json);
}
