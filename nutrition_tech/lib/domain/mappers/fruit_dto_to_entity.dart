import 'package:nutrition_tech/data/dto/fruit_dto.dart';
import 'package:nutrition_tech/domain/entities/fruit.dart';
import 'package:nutrition_tech/domain/entities/nutritions.dart';

extension FruitDtoToEntity on FruitDto {
  Fruit toEntity() => Fruit(
    id: id,
    genus: genus,
    name: name,
    family: family,
    order: order,
    nutritions: Nutritions(
      carbohydrates: carbohydrates,
      protein: protein,
      fat: fat,
      calories: calories,
      sugar: sugar,
    ),
  );
}

extension FruitEntityToDto on Fruit {
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
