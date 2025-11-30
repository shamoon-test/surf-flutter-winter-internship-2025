// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Nutritions extends Equatable {
  final double carbohydrates;
  final double protein;
  final double fat;
  final int calories;
  final double sugar;

  const Nutritions({
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.sugar,
  });

  Nutritions copyWith({
    double? carbohydrates,
    double? protein,
    double? fat,
    int? calories,
    double? sugar,
  }) {
    return Nutritions(
      carbohydrates: carbohydrates ?? this.carbohydrates,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      calories: calories ?? this.calories,
      sugar: sugar ?? this.sugar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      'calories': calories,
      'sugar': sugar,
    };
  }

  factory Nutritions.fromMap(Map<String, dynamic> map) {
    return Nutritions(
      carbohydrates: map['carbohydrates'] as double,
      protein: map['protein'] as double,
      fat: map['fat'] as double,
      calories: map['calories'] as int,
      sugar: map['sugar'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutritions.fromJson(String source) =>
      Nutritions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  factory Nutritions.empty() =>
      Nutritions(carbohydrates: 0, protein: 0, fat: 0, calories: 0, sugar: 0);

  Nutritions operator +(Nutritions other) {
    return Nutritions(
      carbohydrates: carbohydrates + other.carbohydrates,
      protein: protein + other.protein,
      fat: fat + other.fat,
      calories: calories + other.calories,
      sugar: sugar + other.sugar,
    );
  }

  @override
  List<Object> get props {
    return [
      carbohydrates,
      protein,
      fat,
      calories,
      sugar,
    ];
  }
}
