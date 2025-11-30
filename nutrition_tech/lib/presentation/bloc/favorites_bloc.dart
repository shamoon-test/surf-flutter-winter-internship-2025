import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrition_tech/domain/entities/fruit.dart';
import 'package:nutrition_tech/domain/usecases/add_favorite_fruit.dart';
import 'package:nutrition_tech/domain/usecases/get_favorite_fruits.dart';
import 'package:nutrition_tech/domain/usecases/remove_favorite_fruit.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoriteFruits getFavoriteFruits;
  final AddFavoriteFruit addFavoriteFruit;
  final RemoveFavoriteFruit removeFavoriteFruit;

  FavoritesBloc(
    this.getFavoriteFruits,
    this.addFavoriteFruit,
    this.removeFavoriteFruit,
  ) : super(FavoritesInitial()) {
    on<FavoritesGetList>((event, emit) async {
      if(state is! FavoritesLoaded) emit(FavoritesLoading());
      try {
        List<Fruit> data = await getFavoriteFruits();
        emit(FavoritesLoaded(data));
      } catch (e) {
        emit(FavoritesErrorLoad());
      }
    });
    on<FavoritesAddFruit>((event, emit) async {
      try {
        await addFavoriteFruit(event.fruit);
      } catch (e) {
        emit(FavoritesErrorAdd());
      } finally {
        add(FavoritesGetList());
      }
    });
    on<FavoritesRemoveFruit>((event, emit) async {
      try {
        await removeFavoriteFruit(event.fruit);
      } catch (e) {
        emit(FavoritesErrorRemove());
      } finally {
        add(FavoritesGetList());
      }
    });
    add(FavoritesGetList());
  }
}
