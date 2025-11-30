part of 'fruits_bloc.dart';

sealed class FruitsEvent extends Equatable {
  const FruitsEvent();

  @override
  List<Object> get props => [];
}

final class FruitsGetList extends FruitsEvent {}