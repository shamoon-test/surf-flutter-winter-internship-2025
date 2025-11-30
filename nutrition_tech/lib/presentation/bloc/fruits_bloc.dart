import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrition_tech/domain/usecases/get_fruits.dart';

import '../../domain/entities/fruit.dart';

part 'fruits_event.dart';
part 'fruits_state.dart';

class FruitsBloc extends Bloc<FruitsEvent, FruitsState> {
  final GetFruits getFruits;

  FruitsBloc(this.getFruits) : super(FruitsInitial()) {
    on<FruitsGetList>((event, emit) async {
      emit(FruitsLoading());
      try {
        List<Fruit> data = await getFruits();
        emit(FruitsLoaded(data));
      } catch (e) {
        emit(FruitsError());
      }
    });
    add(FruitsGetList());
  }
}
