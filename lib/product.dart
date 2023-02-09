import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:playground/price.dart';
import 'package:playground/productVariant.dart';

part 'product.g.dart';

@collection
class Product {
  Id? id = Isar.autoIncrement;
  String name;
  String? description;
  String category;
  int? popularity;
  IsarLink<Price> prices = IsarLink<Price>();

  IsarLinks<ProductVariant> variants = IsarLinks<ProductVariant>();
  Product({
    this.id,
    this.name = 'Lays',
    this.description = 'Cruncy Chips',
    this.category = 'snacks',
    this.popularity = 12,
  });

  Product copyWith({
    Id? id,
    String? name,
    String? description,
    String? category,
    int? popularity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      popularity: popularity ?? this.popularity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    if (description != null) {
      result.addAll({'description': description});
    }
    result.addAll({'category': category});
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'] ?? '',
      description: map['description'],
      category: map['category'] ?? '',
      popularity: map['popularity']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, category: $category, popularity: $popularity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.category == category &&
        other.popularity == popularity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        category.hashCode ^
        popularity.hashCode;
  }
}

