part of 'receipts_bloc.dart';

sealed class ReceiptsEvent extends Equatable {
  const ReceiptsEvent();

  @override
  List<Object?> get props => [];
}

final class ReceiptsGetList extends ReceiptsEvent {}

final class ReceiptsCreate extends ReceiptsEvent {
  final String name;
  final String? description;
  final List<Fruit> fruits;
  const ReceiptsCreate({
    required this.name,
    this.description,
    required this.fruits,
  });

  @override
  List<Object?> get props => [
    name,
    description,
    DeepCollectionEquality().hash(fruits),
  ];
}

final class ReceiptsDelete extends ReceiptsEvent {
  final String uuid;
  const ReceiptsDelete(this.uuid);

  @override
  List<Object?> get props => [uuid];
}
