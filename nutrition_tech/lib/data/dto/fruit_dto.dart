// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FruitDto extends Equatable {
  final int id;
  final String genus;
  final String name;
  final String family;
  final String order;
  final double carbohydrates;
  final double protein;
  final double fat;
  final int calories;
  final double sugar;

  const FruitDto({
    required this.id,
    required this.genus,
    required this.name,
    required this.family,
    required this.order,
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.sugar,
  });

  FruitDto copyWith({
    int? id,
    String? genus,
    String? name,
    String? family,
    String? order,
    double? carbohydrates,
    double? protein,
    double? fat,
    int? calories,
    double? sugar,
  }) {
    return FruitDto(
      id: id ?? this.id,
      genus: genus ?? this.genus,
      name: name ?? this.name,
      family: family ?? this.family,
      order: order ?? this.order,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      calories: calories ?? this.calories,
      sugar: sugar ?? this.sugar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'genus': genus,
      'name': name,
      'family': family,
      'order': order,
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      'calories': calories,
      'sugar': sugar,
    };
  }

  factory FruitDto.fromMap(Map<String, dynamic> map) {
    return FruitDto(
      id: map['id'] as int,
      genus: map['genus'] as String,
      name: map['name'] as String,
      family: map['family'] as String,
      order: map['order'] as String,
      carbohydrates: map['carbohydrates'] as double,
      protein: map['protein'] as double,
      fat: map['fat'] as double,
      calories: map['calories'] as int,
      sugar: map['sugar'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory FruitDto.fromJson(String source) => FruitDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      genus,
      name,
      family,
      order,
      carbohydrates,
      protein,
      fat,
      calories,
      sugar,
    ];
  }
}
