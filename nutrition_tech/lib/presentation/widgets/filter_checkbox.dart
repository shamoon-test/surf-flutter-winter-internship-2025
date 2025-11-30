// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_tech/domain/entities/filter.dart';
import 'package:nutrition_tech/presentation/bloc/filter_cubit.dart';

class FilterCheckbox extends StatelessWidget {
  const FilterCheckbox(this.current, this.onChanged, {super.key});

  final Filter current;
  final void Function(bool?, Filter) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, List<Filter>>(
      builder: (context, filters) {
        return CheckboxListTile(
          title: Text(current.name),
          value: filters.contains(current),
          onChanged: (v) => onChanged(v, current),
        );
      },
    );
  }
}
