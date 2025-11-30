import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrition_tech/domain/entities/receipt.dart';
import 'package:nutrition_tech/domain/usecases/create_receipt.dart';
import 'package:nutrition_tech/domain/usecases/get_receipts.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/fruit.dart';
import '../../domain/usecases/delete_receipt.dart';

part 'receipts_event.dart';
part 'receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  final GetReceipts getReceipts;
  final CreateReceipt createReceipt;
  final DeleteReceipt deleteReceipt;

  ReceiptsBloc(this.getReceipts, this.createReceipt, this.deleteReceipt)
    : super(ReceiptsInitial()) {
    on<ReceiptsGetList>((event, emit) async {
      if (state is! ReceiptsLoaded) emit(ReceiptsLoading());
      try {
        List<Receipt> data = await getReceipts();
        emit(ReceiptsLoaded(data));
      } catch (e) {
        emit(ReceiptsErrorLoad());
      }
    });
    on<ReceiptsCreate>((event, emit) async {
      try {
        final description = event.description ?? '';
        final receipt = Receipt(
          uuid: Uuid().v4(),
          name: event.name,
          description: description.isNotEmpty ? description : null,
          fruits: event.fruits,
        );
        await createReceipt(receipt);
      } catch (e) {
        emit(ReceiptsErrorCreate());
      } finally {
        add(ReceiptsGetList());
      }
    });
    on<ReceiptsDelete>((event, emit) async {
      try {
        await deleteReceipt(event.uuid);
      } catch (e) {
        emit(ReceiptsErrorDelete());
      } finally {
        add(ReceiptsGetList());
      }
    });
    add(ReceiptsGetList());
  }
}
