import 'package:localstore/localstore.dart';
import '../dto/receipt_dto.dart';

abstract class ILocalReceipts {
  Future<List<ReceiptDto>> getReceipts();
  Future<void> createReceipt(ReceiptDto receipt);
  Future<void> deleteReceipt(String uuid);
}

class LocalReceipts implements ILocalReceipts {
  const LocalReceipts();

  Localstore get db => Localstore.instance;
  String get dbName => 'receipts';

  @override
  Future<List<ReceiptDto>> getReceipts() async {
    final fruits = await db.collection(dbName).get();
    if (fruits == null) return <ReceiptDto>[];

    final values = fruits.values.toList();
    return List.generate(
      values.length,
      (index) => ReceiptDto.fromMap(values[index]),
    );
  }

  @override
  Future<void> createReceipt(ReceiptDto receipt) async {
    await db.collection(dbName).doc(receipt.uuid).set(receipt.toMap());
  }

  @override
  Future<void> deleteReceipt(String uuid) async {
    await db.collection(dbName).doc(uuid).delete();
  }
}
