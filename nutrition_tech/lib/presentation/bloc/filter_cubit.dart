import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_tech/domain/entities/filter.dart';

class FilterCubit extends Cubit<List<Filter>> {
  FilterCubit() : super(<Filter>[]);

  void updateFilters(List<Filter> filters) {
    emit(List.from(filters));
  }
}
