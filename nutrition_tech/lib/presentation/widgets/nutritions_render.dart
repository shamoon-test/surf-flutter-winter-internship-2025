import 'package:flutter/material.dart';
import 'package:nutrition_tech/domain/entities/nutritions.dart';

class NutritionsRender extends StatelessWidget {
  const NutritionsRender(this.nutritions, {super.key});

  final Nutritions nutritions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: double.infinity),
        Text('Питательные свойства:'),
        Text('Calories: ${nutritions.calories}'),
        Text('Fat: ${nutritions.fat}'),
        Text('Sugar: ${nutritions.sugar}'),
        Text('Carbohydrates: ${nutritions.carbohydrates}'),
        Text('Protein: ${nutritions.protein}'),
      ],
    );
  }
}
