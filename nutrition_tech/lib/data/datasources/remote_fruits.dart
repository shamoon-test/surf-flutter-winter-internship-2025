import 'package:nutrition_tech/api/fruityvice_client.dart';
import 'package:nutrition_tech/data/mappers/fruit_api_to_dto.dart';

import '../dto/fruit_dto.dart';

abstract class IRemoteFruits {
  Future<List<FruitDto>> getFruits();
}

class RemoteFruits implements IRemoteFruits {
  final FruityViceApiClient _api;
  const RemoteFruits(this._api);

  @override
  Future<List<FruitDto>> getFruits() async {
    return (await _api.getAllFruits()).map((e) => e.toDto()).toList();
  }
}
