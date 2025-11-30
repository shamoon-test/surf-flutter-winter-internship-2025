import 'package:nutrition_tech/domain/repositories/i_receipts_repository.dart';

class DeleteReceipt {
  final IReceiptsRepository _repo;
  const DeleteReceipt(this._repo);

  Future<void> call(String uuid) => _repo.deleteReceipt(uuid);
}
