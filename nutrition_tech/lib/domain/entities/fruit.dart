// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'nutritions.dart';

class Fruit extends Equatable {
  final int id;
  final String genus;
  final String name;
  final String family;
  final String order;
  final Nutritions nutritions;

  const Fruit({
    required this.id,
    required this.genus,
    required this.name,
    required this.family,
    required this.order,
    required this.nutritions,
  });

  Fruit copyWith({
    int? id,
    String? genus,
    String? name,
    String? family,
    String? order,
    Nutritions? nutritions,
  }) {
    return Fruit(
      id: id ?? this.id,
      genus: genus ?? this.genus,
      name: name ?? this.name,
      family: family ?? this.family,
      order: order ?? this.order,
      nutritions: nutritions ?? this.nutritions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'genus': genus,
      'name': name,
      'family': family,
      'order': order,
      'nutritions': nutritions.toMap(),
    };
  }

  factory Fruit.fromMap(Map<String, dynamic> map) {
    return Fruit(
      id: map['id'] as int,
      genus: map['genus'] as String,
      name: map['name'] as String,
      family: map['family'] as String,
      order: map['order'] as String,
      nutritions: Nutritions.fromMap(map['nutritions'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Fruit.fromJson(String source) =>
      Fruit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [id, genus, name, family, order, nutritions];
  }
}
