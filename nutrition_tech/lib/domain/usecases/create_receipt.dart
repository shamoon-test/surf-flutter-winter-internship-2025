import 'package:nutrition_tech/domain/entities/receipt.dart';
import 'package:nutrition_tech/domain/repositories/i_receipts_repository.dart';

import '../mappers/receipt_dto_to_entity.dart';

class CreateReceipt {
  final IReceiptsRepository _repo;
  const CreateReceipt(this._repo);

  Future<void> call(Receipt receipt) => _repo.createReceipt(receipt.toDto());
}
