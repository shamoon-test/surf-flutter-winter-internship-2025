// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:nutrition_tech/data/dto/fruit_dto.dart';

class ReceiptDto extends Equatable {
  final String uuid;
  final String name;
  final String? description;
  final List<FruitDto> fruits;

  const ReceiptDto({
    required this.uuid,
    required this.name,
    this.description,
    required this.fruits,
  });

  ReceiptDto copyWith({
    String? uuid,
    String? name,
    String? description,
    List<FruitDto>? fruits,
  }) {
    return ReceiptDto(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      description: description ?? this.description,
      fruits: fruits ?? this.fruits,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'name': name,
      'description': description,
      'fruits': fruits.map((x) => x.toMap()).toList(),
    };
  }

  factory ReceiptDto.fromMap(Map<String, dynamic> map) {
    return ReceiptDto(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      fruits: List<FruitDto>.from(
        (map['fruits'] as List<dynamic>).map<FruitDto>(
          (x) => FruitDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReceiptDto.fromJson(String source) =>
      ReceiptDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [uuid, name, description, DeepCollectionEquality().hash(fruits)];
}
