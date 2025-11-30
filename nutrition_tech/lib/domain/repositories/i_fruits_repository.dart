import '../../data/dto/fruit_dto.dart';

abstract class IFruitsRepository {
  Future<List<FruitDto>> getFruits();
  Future<List<FruitDto>> getFavoritesFruits();
  Future<void> addFavoriteFruit(FruitDto fruit);
  Future<void> deleteFavoriteFruit(FruitDto fruit);
}