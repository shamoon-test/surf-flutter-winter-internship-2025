import 'package:nutrition_tech/data/dto/receipt_dto.dart';

abstract class IReceiptsRepository {
  Future<List<ReceiptDto>> getReceipts();
  Future<void> createReceipt(ReceiptDto receipt);
  Future<void> deleteReceipt(String uuid);
}
