import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_tech/domain/entities/fruit.dart';
import 'package:nutrition_tech/presentation/widgets/add_to_favorite.dart';

import '../bloc/favorites_bloc.dart';

class FruitCard extends StatelessWidget {
  const FruitCard({
    required this.fruit,
    this.onTap,
    this.selected,
    super.key,
  });

  final Fruit fruit;
  final bool? selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, favoritesState) {
        List<Fruit> favorites = [];
        if (favoritesState is FavoritesLoaded) {
          favorites = favoritesState.data;
        }
        final bool isFavorite = favorites.contains(fruit);

        return Card(
          color: selected == true ? Colors.blue.shade200 : null,
          child: ListTile(
            onTap: onTap,
            title: Text(fruit.name),
            subtitle: Text(fruit.family),
            trailing: selected == null ? AddToFavorite(isFavorite: isFavorite, fruit: fruit) : null
          ),
        );
      },
    );
  }
}
