part of 'receipts_bloc.dart';

sealed class ReceiptsState extends Equatable {
  const ReceiptsState();

  @override
  List<Object> get props => [];
}

final class ReceiptsInitial extends ReceiptsState {}

final class ReceiptsLoading extends ReceiptsState {}

final class ReceiptsLoaded extends ReceiptsState {
  final List<Receipt> data;
  const ReceiptsLoaded(this.data);

  @override
  List<Object> get props => [DeepCollectionEquality().hash(data)];
}

final class ReceiptsErrorLoad extends ReceiptsState {}
final class ReceiptsErrorCreate extends ReceiptsState {}
final class ReceiptsErrorDelete extends ReceiptsState {}
