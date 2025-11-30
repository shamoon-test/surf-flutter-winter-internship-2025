
import 'package:dio/dio.dart';
import 'package:nutrition_tech/api/models/fruit_api_model.dart';
import 'package:retrofit/retrofit.dart';

part 'fruityvice_client.g.dart';

@RestApi(baseUrl: '')
abstract class FruityViceApiClient {
  factory FruityViceApiClient(Dio dio, {String? baseUrl}) =
      _FruityViceApiClient;

  @GET('/api/fruit/all')
  Future<List<FruitApiModel>> getAllFruits();
}
