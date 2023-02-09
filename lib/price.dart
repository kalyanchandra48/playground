import 'package:isar/isar.dart';
import 'package:playground/tax.dart';

part 'price.g.dart';

@collection
class Price {
  Id? id = Isar.autoIncrement;
  late int costPrice;
  late int sellingPrice;
  IsarLinks<Tax> taxes = IsarLinks<Tax>();
}
