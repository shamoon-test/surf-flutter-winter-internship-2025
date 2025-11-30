part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class FavoritesGetList extends FavoritesEvent {}

final class FavoritesAddFruit extends FavoritesEvent {
  final Fruit fruit;
  const FavoritesAddFruit({required this.fruit});

  @override
  List<Object?> get props => [fruit];
}

final class FavoritesRemoveFruit extends FavoritesEvent {
  final Fruit fruit;
  const FavoritesRemoveFruit({required this.fruit});

  @override
  List<Object?> get props => [fruit];
}
