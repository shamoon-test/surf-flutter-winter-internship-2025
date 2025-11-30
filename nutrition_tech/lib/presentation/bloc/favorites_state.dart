part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<Fruit> data;
  const FavoritesLoaded(this.data);

  @override
  List<Object> get props => [DeepCollectionEquality().hash(data)];
}

final class FavoritesErrorLoad extends FavoritesState {}

final class FavoritesErrorAdd extends FavoritesState {}

final class FavoritesErrorRemove extends FavoritesState {}
