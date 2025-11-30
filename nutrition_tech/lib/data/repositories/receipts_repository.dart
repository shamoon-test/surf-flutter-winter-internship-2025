import 'package:nutrition_tech/data/datasources/local_receipts.dart';

import '../../domain/repositories/i_receipts_repository.dart';
import '../dto/receipt_dto.dart';

class ReceiptsRepository implements IReceiptsRepository {
  final ILocalReceipts _local;
  const ReceiptsRepository(this._local);
  @override
  Future<List<ReceiptDto>> getReceipts() => _local.getReceipts();

  @override
  Future<void> createReceipt(ReceiptDto receipt) =>
      _local.createReceipt(receipt);

  @override
  Future<void> deleteReceipt(String uuid) =>
      _local.deleteReceipt(uuid);
}
