part of 'fruits_bloc.dart';

sealed class FruitsState extends Equatable {
  const FruitsState();

  @override
  List<Object> get props => [];
}

final class FruitsInitial extends FruitsState {}

final class FruitsLoading extends FruitsState {}

final class FruitsLoaded extends FruitsState {
  final List<Fruit> data;
  const FruitsLoaded(this.data);

  @override
  List<Object> get props => [DeepCollectionEquality().hash(data)];
}

final class FruitsError extends FruitsState {}
