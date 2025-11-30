import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/routes.dart';
import '../../domain/entities/fruit.dart';
import '../bloc/favorites_bloc.dart';
import '../widgets/fruit_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Избранное')),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, fruitsState) {
          if (fruitsState is FavoritesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (fruitsState is FavoritesErrorLoad) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Произошла ошибка')),
                TextButton(
                  onPressed: () {
                    context.read<FavoritesBloc>().add(FavoritesGetList());
                  },
                  child: Text('Повторить'),
                ),
              ],
            );
          }
          List<Fruit> fruits = [];
          if (fruitsState is FavoritesLoaded) {
            fruits = fruitsState.data;
          }

          if (fruits.isEmpty) {
            return Center(
              child: Text('Вы пока ничего не добавили в избранное'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(4.0),
            itemCount: fruits.length,
            itemBuilder: (context, index) => FruitCard(
              fruit: fruits[index],
              onTap: () {
                context.pushNamed(
                  AppRoute.fruitDetails.name,
                  extra: fruits[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
