// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:nutrition_tech/domain/entities/fruit.dart';
import 'package:nutrition_tech/domain/entities/nutritions.dart';

class Receipt extends Equatable {
  final String uuid;
  final String name;
  final String? description;
  final List<Fruit> fruits;

  String get fruitsNames => fruits.map((e) => e.name).join(', ');

  Nutritions get nutritions =>
      fruits.map((e) => e.nutritions).fold(Nutritions.empty(), (a, b) => a + b);

  const Receipt({
    required this.uuid,
    required this.name,
    this.description,
    required this.fruits,
  });

  Receipt copyWith({
    String? uuid,
    String? name,
    String? description,
    List<Fruit>? fruits,
  }) {
    return Receipt(
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

  factory Receipt.fromMap(Map<String, dynamic> map) {
    return Receipt(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      fruits: List<Fruit>.from(
        (map['fruits'] as List<int>).map<Fruit>(
          (x) => Fruit.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Receipt.fromJson(String source) =>
      Receipt.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
    uuid,
    name,
    description,
    DeepCollectionEquality().hash(fruits),
  ];
}
