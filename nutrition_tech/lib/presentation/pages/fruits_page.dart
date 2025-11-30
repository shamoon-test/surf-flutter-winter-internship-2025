import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition_tech/core/router/routes.dart';
import 'package:nutrition_tech/domain/entities/filter.dart';
import 'package:nutrition_tech/domain/usecases/fruit_filters.dart';
import 'package:nutrition_tech/presentation/bloc/fruits_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/filter_cubit.dart';
import 'package:nutrition_tech/presentation/bloc/sort_cubit.dart';
import 'package:nutrition_tech/presentation/widgets/fruit_card.dart';

import '../../domain/entities/fruit.dart';

class FruitsPage extends StatelessWidget {
  const FruitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Filter> filters = context.watch<FilterCubit>().state;
    SortType sortType = context.watch<SortCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Фрукты'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.sort.name);
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: BlocBuilder<FruitsBloc, FruitsState>(
        builder: (context, fruitsState) {
          if (fruitsState is FruitsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (fruitsState is FruitsError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Произошла ошибка')),
                TextButton(
                  onPressed: () {
                    context.read<FruitsBloc>().add(FruitsGetList());
                  },
                  child: Text('Повторить'),
                ),
              ],
            );
          }
          List<Fruit> fruits = [];
          if (fruitsState is FruitsLoaded) {
            fruits = fruitsState.data;
          }

          fruits = fruits.applyFilters(filters);
          switch (sortType) {
            case SortType.atoz:
              fruits.sort((a, b) => a.name.compareTo(b.name));
              break;
            case SortType.ztoa:
              fruits.sort((a, b) => b.name.compareTo(a.name));
              break;
            case SortType.caloriesUp:
              fruits.sort(
                (a, b) =>
                    a.nutritions.calories.compareTo(b.nutritions.calories),
              );
              break;
            case SortType.caloriesDown:
              fruits.sort(
                (a, b) =>
                    b.nutritions.calories.compareTo(a.nutritions.calories),
              );
              break;
          }

          return ListView.builder(
            padding: EdgeInsets.all(4.0),
            itemCount: fruits.length,
            itemBuilder: (context, index) => FruitCard(
              key: ValueKey(fruits[index].id),
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
