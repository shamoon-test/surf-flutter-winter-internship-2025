class NutritionsApiModel {
  final double carbohydrates;
  final double protein;
  final double fat;
  final int calories;
  final double sugar;

  const NutritionsApiModel({
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.sugar,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      'calories': calories,
      'sugar': sugar,
    };
  }

  factory NutritionsApiModel.fromJson(Map<String, dynamic> map) {
    return NutritionsApiModel(
      carbohydrates: map['carbohydrates'].toDouble() as double,
      protein: map['protein'].toDouble() as double,
      fat: map['fat'].toDouble() as double,
      calories: map['calories'].toInt() as int,
      sugar: map['sugar'].toDouble() as double,
    );
  }
}
