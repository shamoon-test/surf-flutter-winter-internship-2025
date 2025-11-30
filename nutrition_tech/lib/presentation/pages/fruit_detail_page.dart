import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/favorites_bloc.dart';
import 'package:nutrition_tech/presentation/widgets/nutritions_render.dart';

import '../../domain/entities/fruit.dart';
import '../widgets/add_to_favorite.dart';

class FruitDetailPage extends StatelessWidget {
  const FruitDetailPage(this.fruit, {super.key});

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, favoritesState) {
        List<Fruit> favorites = [];
        if (favoritesState is FavoritesLoaded) {
          favorites = favoritesState.data;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(fruit.name),
            actions: [
              AddToFavorite(
                fruit: fruit,
                isFavorite: favorites.contains(fruit),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Family: ${fruit.family}'),
                Text('Order: ${fruit.order}'),
                Text('Genus: ${fruit.genus}'),
                Divider(),
                NutritionsRender(fruit.nutritions),
              ],
            ),
          ),
        );
      },
    );
  }
}
