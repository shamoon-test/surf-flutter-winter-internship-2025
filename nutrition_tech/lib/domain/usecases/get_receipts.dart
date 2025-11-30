import '../entities/receipt.dart';
import '../repositories/i_receipts_repository.dart';
import '../mappers/receipt_dto_to_entity.dart';

class GetReceipts {
  final IReceiptsRepository _repo;
  const GetReceipts(this._repo);

  Future<List<Receipt>> call() async =>
      (await _repo.getReceipts()).map((e) => e.toEntity()).toList();
}
