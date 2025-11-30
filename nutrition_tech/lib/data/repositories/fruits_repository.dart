import 'package:nutrition_tech/data/dto/fruit_dto.dart';

import '../../domain/repositories/i_fruits_repository.dart';
import '../datasources/local_fruits.dart';
import '../datasources/remote_fruits.dart';

class FruitsRepository implements IFruitsRepository {
  final ILocalFruits _local;
  final IRemoteFruits _remote;

  const FruitsRepository(this._local, this._remote);

  @override
  Future<List<FruitDto>> getFruits() => _remote.getFruits();

  @override
  Future<List<FruitDto>> getFavoritesFruits() => _local.getFavoriteFruits();

  @override
  Future<void> deleteFavoriteFruit(FruitDto fruit) =>
      _local.removeFromFavorite(fruit);

  @override
  Future<void> addFavoriteFruit(FruitDto fruit) => _local.addToFavorite(fruit);
}
