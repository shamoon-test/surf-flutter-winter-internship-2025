import 'package:nutrition_tech/api/models/nutritions_api_model.dart';

class FruitApiModel {
  final String genus;
  final String name;
  final int id;
  final String family;
  final String order;
  final NutritionsApiModel nutritions;

  const FruitApiModel({
    required this.genus,
    required this.name,
    required this.id,
    required this.family,
    required this.order,
    required this.nutritions,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'genus': genus,
      'name': name,
      'id': id,
      'family': family,
      'order': order,
      'nutritions': nutritions.toJson(),
    };
  }

  factory FruitApiModel.fromJson(Map<String, dynamic> map) {
    return FruitApiModel(
      genus: map['genus'] as String,
      name: map['name'] as String,
      id: map['id'].toInt() as int,
      family: map['family'] as String,
      order: map['order'] as String,
      nutritions: NutritionsApiModel.fromJson(
        map['nutritions'] as Map<String, dynamic>,
      ),
    );
  }
}
