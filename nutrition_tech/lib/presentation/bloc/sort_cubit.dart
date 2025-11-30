import 'package:flutter_bloc/flutter_bloc.dart';

class SortCubit extends Cubit<SortType> {
  SortCubit() : super(SortType.atoz);

  void change(SortType type) {
    emit(type);
  }
}

enum SortType { atoz, ztoa, caloriesUp, caloriesDown }
