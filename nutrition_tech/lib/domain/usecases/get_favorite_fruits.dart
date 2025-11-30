import 'package:nutrition_tech/domain/mappers/fruit_dto_to_entity.dart';

import '../entities/fruit.dart';
import '../repositories/i_fruits_repository.dart';

class GetFavoriteFruits {
  final IFruitsRepository _repo;
  const GetFavoriteFruits(this._repo);

  Future<List<Fruit>> call() async => (await _repo.getFavoritesFruits()).map((e) => e.toEntity()).toList();
}