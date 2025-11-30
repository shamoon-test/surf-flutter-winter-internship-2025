import 'package:nutrition_tech/domain/mappers/fruit_dto_to_entity.dart';

import '../entities/fruit.dart';
import '../repositories/i_fruits_repository.dart';

class AddFavoriteFruit {
  final IFruitsRepository _repo;
  const AddFavoriteFruit(this._repo);

  Future<void> call(Fruit fruit) => _repo.addFavoriteFruit(fruit.toDto());
}
