import 'package:nutrition_tech/domain/mappers/fruit_dto_to_entity.dart';

import '../../data/dto/receipt_dto.dart';
import '../entities/receipt.dart';

extension ReceiptDtoToEntity on ReceiptDto {
  Receipt toEntity() => Receipt(
    uuid: uuid,
    name: name,
    description: description,
    fruits: fruits.map((e) => e.toEntity()).toList(),
  );
}

extension ReceiptEntityToDto on Receipt {
  ReceiptDto toDto() => ReceiptDto(
    uuid: uuid,
    name: name,
    description: description,
    fruits: fruits.map((e) => e.toDto()).toList(),
  );
}
