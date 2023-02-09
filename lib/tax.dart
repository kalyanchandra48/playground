import 'dart:convert';

import 'package:isar/isar.dart';

part 'tax.g.dart';

@collection
class Tax {
  Id? id = Isar.autoIncrement;
  String type;
  String percentage;
  int? amount;
  Tax({
    required this.type,
    required this.percentage,
    this.amount,
  });

  Tax copyWith({
    String? type,
    String? percentage,
    int? amount,
  }) {
    return Tax(
      type: type ?? this.type,
      percentage: percentage ?? this.percentage,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'percentage': percentage});
    if (amount != null) {
      result.addAll({'amount': amount});
    }

    return result;
  }

  factory Tax.fromMap(Map<String, dynamic> map) {
    return Tax(
      type: map['type'] ?? '',
      percentage: map['percentage'] ?? '',
      amount: map['amount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tax.fromJson(String source) => Tax.fromMap(json.decode(source));

  @override
  String toString() =>
      'Tax(type: $type, percentage: $percentage, amount: $amount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tax &&
        other.type == type &&
        other.percentage == percentage &&
        other.amount == amount;
  }

  @override
  int get hashCode => type.hashCode ^ percentage.hashCode ^ amount.hashCode;
}
