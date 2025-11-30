import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrition_tech/api/fruityvice_client.dart';
import 'package:nutrition_tech/data/datasources/local_fruits.dart';
import 'package:nutrition_tech/data/datasources/local_receipts.dart';
import 'package:nutrition_tech/data/datasources/remote_fruits.dart';
import 'package:nutrition_tech/data/repositories/fruits_repository.dart';
import 'package:nutrition_tech/data/repositories/receipts_repository.dart';
import 'package:nutrition_tech/domain/repositories/i_fruits_repository.dart';
import 'package:nutrition_tech/domain/repositories/i_receipts_repository.dart';
import 'package:nutrition_tech/domain/usecases/add_favorite_fruit.dart';
import 'package:nutrition_tech/domain/usecases/create_receipt.dart';
import 'package:nutrition_tech/domain/usecases/delete_receipt.dart';
import 'package:nutrition_tech/domain/usecases/get_favorite_fruits.dart';
import 'package:nutrition_tech/domain/usecases/get_fruits.dart';
import 'package:nutrition_tech/domain/usecases/get_receipts.dart';
import 'package:nutrition_tech/domain/usecases/remove_favorite_fruit.dart';
import 'package:nutrition_tech/presentation/bloc/favorites_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/filter_cubit.dart';
import 'package:nutrition_tech/presentation/bloc/fruits_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/receipts_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/sort_cubit.dart';

GetIt get sl => GetIt.instance;

void registerDi() {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 30),
      contentType: 'application/json',
    ),
  );

  sl.registerSingleton(
    FruityViceApiClient(dio, baseUrl: 'https://www.fruityvice.com'),
  );

  sl.registerSingleton<IRemoteFruits>(RemoteFruits(sl()));
  sl.registerSingleton<ILocalFruits>(LocalFruits());
  sl.registerSingleton<IFruitsRepository>(FruitsRepository(sl(), sl()));

  sl.registerLazySingleton(() => GetFruits(sl()));
  sl.registerLazySingleton(() => GetFavoriteFruits(sl()));
  sl.registerLazySingleton(() => AddFavoriteFruit(sl()));
  sl.registerLazySingleton(() => RemoveFavoriteFruit(sl()));

  sl.registerSingleton<ILocalReceipts>(LocalReceipts());
  sl.registerSingleton<IReceiptsRepository>(ReceiptsRepository(sl()));

  sl.registerLazySingleton(() => GetReceipts(sl()));
  sl.registerLazySingleton(() => CreateReceipt(sl()));
  sl.registerLazySingleton(() => DeleteReceipt(sl()));

  sl.registerFactory(() => FruitsBloc(sl()));
  sl.registerFactory(() => FavoritesBloc(sl(), sl(), sl()));
  sl.registerFactory(() => FilterCubit());
  sl.registerFactory(() => SortCubit());
  sl.registerFactory(() => ReceiptsBloc(sl(), sl(), sl()));
}
