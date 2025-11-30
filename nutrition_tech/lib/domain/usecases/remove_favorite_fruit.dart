import 'package:nutrition_tech/domain/mappers/fruit_dto_to_entity.dart';

import '../entities/fruit.dart';
import '../repositories/i_fruits_repository.dart';

class RemoveFavoriteFruit {
  final IFruitsRepository _repo;
  const RemoveFavoriteFruit(this._repo);

  Future<void> call(Fruit fruit) => _repo.deleteFavoriteFruit(fruit.toDto());
}
