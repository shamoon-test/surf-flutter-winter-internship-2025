// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:nutrition_tech/presentation/bloc/sort_cubit.dart';
import 'package:nutrition_tech/presentation/widgets/filter_checkbox.dart';

import '../../domain/entities/filter.dart';
import '../bloc/filter_cubit.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  SortType sortType = SortType.atoz;
  List<Filter> filters = [];

  @override
  void initState() {
    super.initState();
    sortType = context.read<SortCubit>().state;
    filters = context.read<FilterCubit>().state;
  }

  void changeFilter(bool? value, Filter current) {
    setState(() {
      if (!filters.remove(current)) {
        filters.add(current);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Фильтры')),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            context.read<FilterCubit>().updateFilters(filters);
            context.read<SortCubit>().change(sortType);
            context.pop();
          },
          child: Text('Применить'),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Сортировка:'),
              RadioGroup<SortType>(
                groupValue: sortType,
                onChanged: (v) {
                  if (v != null) {
                    setState(() {
                      sortType = v;
                    });
                  }
                },
                child: Column(
                  children: [
                    RadioListTile(value: SortType.atoz, title: Text('A-Z')),
                    RadioListTile(value: SortType.ztoa, title: Text('Z-A')),
                    RadioListTile(
                      value: SortType.caloriesUp,
                      title: Text('Колории (возрастание)'),
                    ),
                    RadioListTile(
                      value: SortType.caloriesDown,
                      title: Text('Калории (убывание)'),
                    ),
                  ],
                ),
              ),
              Divider(),
              Text('Фильтры:'),
              Column(
                children: [
                  FilterCheckbox(FilterBrakfast(), changeFilter),
                  FilterCheckbox(FilterFullness(), changeFilter),
                  FilterCheckbox(FilterSnack(), changeFilter),
                  FilterCheckbox(FilterTraining(), changeFilter),
                  FilterCheckbox(FilterDiet(), changeFilter),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
