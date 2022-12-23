// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryFoodsDTO _$CategoryFoodsDTOFromJson(Map<String, dynamic> json) =>
    CategoryFoodsDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryFoodsDTOToJson(CategoryFoodsDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataDTO _$DataDTOFromJson(Map<String, dynamic> json) => DataDTO(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : AttributesDTO.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataDTOToJson(DataDTO instance) => <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

CategoriesDTO _$CategoriesDTOFromJson(Map<String, dynamic> json) =>
    CategoriesDTO(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDTOToJson(CategoriesDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AttributesDTO _$AttributesDTOFromJson(Map<String, dynamic> json) =>
    AttributesDTO(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      photo: json['photo'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categories: json['categories'] == null
          ? null
          : CategoriesDTO.fromJson(json['categories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttributesDTOToJson(AttributesDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'photo': instance.photo,
      'gallery': instance.gallery,
      'categories': instance.categories,
    };
