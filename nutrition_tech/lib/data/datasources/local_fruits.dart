import 'package:localstore/localstore.dart';
import '../dto/fruit_dto.dart';

abstract class ILocalFruits {
  Future<List<FruitDto>> getFavoriteFruits();
  Future<void> addToFavorite(FruitDto fruit);
  Future<void> removeFromFavorite(FruitDto fruit);
}

class LocalFruits implements ILocalFruits {
  const LocalFruits();

  Localstore get db => Localstore.instance;
  String get dbName => 'fruits';

  @override
  Future<List<FruitDto>> getFavoriteFruits() async {
    final fruits = await db.collection(dbName).get();
    if (fruits == null) return <FruitDto>[];

    final values = fruits.values.toList();
    return List.generate(
      values.length,
      (index) => FruitDto.fromMap(values[index]),
    );
  }

  @override
  Future<void> addToFavorite(FruitDto fruit) async {
    await db.collection(dbName).doc(fruit.id.toString()).set(fruit.toMap());
  }

  @override
  Future<void> removeFromFavorite(FruitDto fruit) async {
    await db.collection(dbName).doc(fruit.id.toString()).delete();
  }
}
