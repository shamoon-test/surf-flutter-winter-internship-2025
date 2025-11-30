import '../entities/filter.dart';
import '../entities/fruit.dart';

extension FruitsFiltration on List<Fruit> {
  List<Fruit> applyFilters(List<Filter> filters) {
    return _filterFruits(this, filters);
  }

  List<Fruit> _filterFruits(List<Fruit> fruits, List<Filter> filters) {
    if (filters.isEmpty) return fruits;

    return fruits.where((fruit) {
      for (final filter in filters) {
        if (!_matchesFilter(fruit, filter)) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  bool _matchesFilter(Fruit fruit, Filter filter) {
    final nutritions = fruit.nutritions;

    if (filter.calories != null) {
      final (minCal, maxCal) = filter.calories!;
      if (!_isInRange(
        nutritions.calories.toDouble(),
        minCal?.toDouble(),
        maxCal?.toDouble(),
      )) {
        return false;
      }
    }

    if (filter.carbohydrates != null) {
      final (minCarb, maxCarb) = filter.carbohydrates!;
      if (!_isInRange(nutritions.carbohydrates, minCarb, maxCarb)) {
        return false;
      }
    }

    if (filter.sugar != null) {
      final (minSugar, maxSugar) = filter.sugar!;
      if (!_isInRange(nutritions.sugar, minSugar, maxSugar)) {
        return false;
      }
    }

    if (filter.protein != null) {
      final (minProt, maxProt) = filter.protein!;
      if (!_isInRange(nutritions.protein, minProt, maxProt)) {
        return false;
      }
    }

    if (filter.fat != null) {
      final (minFat, maxFat) = filter.fat!;
      if (!_isInRange(nutritions.fat, minFat, maxFat)) {
        return false;
      }
    }

    return true;
  }

  bool _isInRange(double value, double? min, double? max) {
    if (min != null && value < min) return false;
    if (max != null && value > max) return false;
    return true;
  }
}
