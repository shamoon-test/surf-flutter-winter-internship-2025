import 'package:equatable/equatable.dart';

sealed class Filter extends Equatable {
  const Filter(
    this.name, {
    this.calories,
    this.carbohydrates,
    this.sugar,
    this.protein,
    this.fat,
  });

  final String name;
  final (int?, int?)? calories;
  final (double?, double?)? carbohydrates;
  final (double?, double?)? sugar;
  final (double?, double?)? protein;
  final (double?, double?)? fat;

  @override
  List<Object?> get props {
    return [
      name,
      calories?.$1,
      calories?.$2,
      carbohydrates?.$1,
      carbohydrates?.$2,
      sugar?.$1,
      sugar?.$2,
      protein?.$1,
      protein?.$2,
      fat?.$1,
      fat?.$2,
    ];
  }
}

final class FilterBrakfast extends Filter {
  const FilterBrakfast()
    : super(
        'Завтрак',
        calories: (40, 80),
        carbohydrates: (10, null),
        sugar: (null, 12),
        fat: (null, 0.5),
      );
}

final class FilterTraining extends Filter {
  const FilterTraining()
    : super(
        'Тренировка',
        calories: (50, 100),
        carbohydrates: (12, null),
        fat: (null, 0.3),
      );
}

final class FilterFullness extends Filter {
  const FilterFullness()
    : super(
        'Сытость',
        calories: (50, 90),
        carbohydrates: (10, 15),
        sugar: (null, 10),
        protein: (0.5, null),
      );
}

final class FilterSnack extends Filter {
  const FilterSnack()
    : super(
        'Перекус',
        calories: (null, 50),
        sugar: (null, 7),
        fat: (null, 0.4),
      );
}

final class FilterDiet extends Filter {
  const FilterDiet()
    : super('Диета', calories: (null, 40), sugar: (null, 6), fat: (null, 0.3));
}
