// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chinesee_food_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChineseeFoodItemCollection on Isar {
  IsarCollection<ChineseeFoodItem> get chineseeFoodItems => this.collection();
}

const ChineseeFoodItemSchema = CollectionSchema(
  name: r'ChineseeFoodItem',
  id: -2331452315164087069,
  properties: {
    r'price': PropertySchema(
      id: 0,
      name: r'price',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 1,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    ),
    r'userLat': PropertySchema(
      id: 3,
      name: r'userLat',
      type: IsarType.double,
    ),
    r'userLong': PropertySchema(
      id: 4,
      name: r'userLong',
      type: IsarType.double,
    )
  },
  estimateSize: _chineseeFoodItemEstimateSize,
  serialize: _chineseeFoodItemSerialize,
  deserialize: _chineseeFoodItemDeserialize,
  deserializeProp: _chineseeFoodItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chineseeFoodItemGetId,
  getLinks: _chineseeFoodItemGetLinks,
  attach: _chineseeFoodItemAttach,
  version: '3.1.0+1',
);

int _chineseeFoodItemEstimateSize(
  ChineseeFoodItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _chineseeFoodItemSerialize(
  ChineseeFoodItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.price);
  writer.writeLong(offsets[1], object.quantity);
  writer.writeString(offsets[2], object.title);
  writer.writeDouble(offsets[3], object.userLat);
  writer.writeDouble(offsets[4], object.userLong);
}

ChineseeFoodItem _chineseeFoodItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChineseeFoodItem();
  object.id = id;
  object.price = reader.readDouble(offsets[0]);
  object.quantity = reader.readLong(offsets[1]);
  object.title = reader.readString(offsets[2]);
  object.userLat = reader.readDouble(offsets[3]);
  object.userLong = reader.readDouble(offsets[4]);
  return object;
}

P _chineseeFoodItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chineseeFoodItemGetId(ChineseeFoodItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chineseeFoodItemGetLinks(ChineseeFoodItem object) {
  return [];
}

void _chineseeFoodItemAttach(
    IsarCollection<dynamic> col, Id id, ChineseeFoodItem object) {
  object.id = id;
}

extension ChineseeFoodItemQueryWhereSort
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QWhere> {
  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChineseeFoodItemQueryWhere
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QWhereClause> {
  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterWhereClause> idBetween(
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

extension ChineseeFoodItemQueryFilter
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QFilterCondition> {
  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      idLessThan(
    Id value, {
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

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLongEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userLong',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLongGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userLong',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLongLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userLong',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterFilterCondition>
      userLongBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userLong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ChineseeFoodItemQueryObject
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QFilterCondition> {}

extension ChineseeFoodItemQueryLinks
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QFilterCondition> {}

extension ChineseeFoodItemQuerySortBy
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QSortBy> {
  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByUserLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      sortByUserLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.desc);
    });
  }
}

extension ChineseeFoodItemQuerySortThenBy
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QSortThenBy> {
  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByUserLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.desc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.asc);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QAfterSortBy>
      thenByUserLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.desc);
    });
  }
}

extension ChineseeFoodItemQueryWhereDistinct
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QDistinct> {
  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QDistinct>
      distinctByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userLat');
    });
  }

  QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QDistinct>
      distinctByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userLong');
    });
  }
}

extension ChineseeFoodItemQueryProperty
    on QueryBuilder<ChineseeFoodItem, ChineseeFoodItem, QQueryProperty> {
  QueryBuilder<ChineseeFoodItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChineseeFoodItem, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ChineseeFoodItem, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<ChineseeFoodItem, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ChineseeFoodItem, double, QQueryOperations> userLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLat');
    });
  }

  QueryBuilder<ChineseeFoodItem, double, QQueryOperations> userLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLong');
    });
  }
}
