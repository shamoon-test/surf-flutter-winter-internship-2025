import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_tech/domain/entities/fruit.dart';
import 'package:nutrition_tech/presentation/bloc/favorites_bloc.dart';

class AddToFavorite extends StatelessWidget {
  const AddToFavorite({
    super.key,
    required this.isFavorite,
    required this.fruit,
  });

  final bool isFavorite;
  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          context.read<FavoritesBloc>().add(FavoritesRemoveFruit(fruit: fruit));
        } else {
          context.read<FavoritesBloc>().add(FavoritesAddFruit(fruit: fruit));
        }
      },
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: Colors.blue,
      ),
    );
  }
}
