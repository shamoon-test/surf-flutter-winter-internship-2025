import 'package:nutrition_tech/domain/mappers/fruit_dto_to_entity.dart';

import '../entities/fruit.dart';
import '../repositories/i_fruits_repository.dart';

class GetFruits {
  final IFruitsRepository _repo;
  const GetFruits(this._repo);

  Future<List<Fruit>> call() async => (await _repo.getFruits()).map((e) => e.toEntity()).toList();
}