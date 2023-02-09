// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPriceCollection on Isar {
  IsarCollection<Price> get prices => this.collection();
}

const PriceSchema = CollectionSchema(
  name: r'Price',
  id: 7989864345434495037,
  properties: {
    r'costPrice': PropertySchema(
      id: 0,
      name: r'costPrice',
      type: IsarType.long,
    ),
    r'sellingPrice': PropertySchema(
      id: 1,
      name: r'sellingPrice',
      type: IsarType.long,
    )
  },
  estimateSize: _priceEstimateSize,
  serialize: _priceSerialize,
  deserialize: _priceDeserialize,
  deserializeProp: _priceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'taxes': LinkSchema(
      id: 6731410865852361462,
      name: r'taxes',
      target: r'Tax',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _priceGetId,
  getLinks: _priceGetLinks,
  attach: _priceAttach,
  version: '3.0.2',
);

int _priceEstimateSize(
  Price object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _priceSerialize(
  Price object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.costPrice);
  writer.writeLong(offsets[1], object.sellingPrice);
}

Price _priceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Price();
  object.costPrice = reader.readLong(offsets[0]);
  object.id = id;
  object.sellingPrice = reader.readLong(offsets[1]);
  return object;
}

P _priceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _priceGetId(Price object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _priceGetLinks(Price object) {
  return [object.taxes];
}

void _priceAttach(IsarCollection<dynamic> col, Id id, Price object) {
  object.id = id;
  object.taxes.attach(col, col.isar.collection<Tax>(), r'taxes', id);
}

extension PriceQueryWhereSort on QueryBuilder<Price, Price, QWhere> {
  QueryBuilder<Price, Price, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PriceQueryWhere on QueryBuilder<Price, Price, QWhereClause> {
  QueryBuilder<Price, Price, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Price, Price, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Price, Price, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Price, Price, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PriceQueryFilter on QueryBuilder<Price, Price, QFilterCondition> {
  QueryBuilder<Price, Price, QAfterFilterCondition> costPriceEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> costPriceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> costPriceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> costPriceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> sellingPriceEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellingPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> sellingPriceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellingPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> sellingPriceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellingPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> sellingPriceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellingPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PriceQueryObject on QueryBuilder<Price, Price, QFilterCondition> {}

extension PriceQueryLinks on QueryBuilder<Price, Price, QFilterCondition> {
  QueryBuilder<Price, Price, QAfterFilterCondition> taxes(FilterQuery<Tax> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'taxes');
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> taxesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'taxes', length, true, length, true);
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> taxesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'taxes', 0, true, 0, true);
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> taxesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'taxes', 0, false, 999999, true);
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> taxesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'taxes', 0, true, length, include);
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> taxesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'taxes', length, include, 999999, true);
    });
  }

  QueryBuilder<Price, Price, QAfterFilterCondition> taxesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'taxes', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PriceQuerySortBy on QueryBuilder<Price, Price, QSortBy> {
  QueryBuilder<Price, Price, QAfterSortBy> sortByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> sortByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> sortBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.asc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> sortBySellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.desc);
    });
  }
}

extension PriceQuerySortThenBy on QueryBuilder<Price, Price, QSortThenBy> {
  QueryBuilder<Price, Price, QAfterSortBy> thenByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> thenByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> thenBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.asc);
    });
  }

  QueryBuilder<Price, Price, QAfterSortBy> thenBySellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.desc);
    });
  }
}

extension PriceQueryWhereDistinct on QueryBuilder<Price, Price, QDistinct> {
  QueryBuilder<Price, Price, QDistinct> distinctByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costPrice');
    });
  }

  QueryBuilder<Price, Price, QDistinct> distinctBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellingPrice');
    });
  }
}

extension PriceQueryProperty on QueryBuilder<Price, Price, QQueryProperty> {
  QueryBuilder<Price, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Price, int, QQueryOperations> costPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costPrice');
    });
  }

  QueryBuilder<Price, int, QQueryOperations> sellingPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellingPrice');
    });
  }
}
