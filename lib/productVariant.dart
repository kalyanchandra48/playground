import 'dart:convert';

import 'package:isar/isar.dart';

part 'productVariant.g.dart';

@collection
class ProductVariant {
  Id? id = Isar.autoIncrement;
  String name;
  String status;
  int stockQuantity;

  ProductVariant({
    this.id,
    this.name = 'beverages',
    this.status = 'Not there',
    this.stockQuantity = 90,
  });

  ProductVariant copyWith({
    Id? id,
    String? name,
    String? status,
    int? stockQuantity,
  }) {
    return ProductVariant(
      id: id,
      name: name ?? this.name,
      status: status ?? this.status,
      stockQuantity: stockQuantity ?? this.stockQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'status': status});
    result.addAll({'stockQuantity': stockQuantity});

    return result;
  }

  factory ProductVariant.fromMap(Map<String, dynamic> map) {
    return ProductVariant(
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      stockQuantity: map['stockQuantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductVariant.fromJson(String source) =>
      ProductVariant.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductVariant(name: $name, status: $status, stockQuantity: $stockQuantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductVariant &&
        other.name == name &&
        other.status == status &&
        other.stockQuantity == stockQuantity;
  }

  @override
  int get hashCode => name.hashCode ^ status.hashCode ^ stockQuantity.hashCode;
}
