import 'package:nutrition_tech/api/models/fruit_api_model.dart';
import 'package:nutrition_tech/data/dto/fruit_dto.dart';

extension FruitApiToDto on FruitApiModel {
  FruitDto toDto() => FruitDto(
    id: id,
    genus: genus,
    name: name,
    family: family,
    order: order,
    carbohydrates: nutritions.carbohydrates,
    protein: nutritions.protein,
    fat: nutritions.fat,
    calories: nutritions.calories,
    sugar: nutritions.sugar,
  );
}
