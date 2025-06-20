// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrderStatusCollection on Isar {
  IsarCollection<OrderStatus> get orderStatus => this.collection();
}

const OrderStatusSchema = CollectionSchema(
  name: r'OrderStatus',
  id: 1875735897422510450,
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
    r'statusOrder': PropertySchema(
      id: 2,
      name: r'statusOrder',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 3,
      name: r'title',
      type: IsarType.string,
    ),
    r'userLat': PropertySchema(
      id: 4,
      name: r'userLat',
      type: IsarType.double,
    ),
    r'userLong': PropertySchema(
      id: 5,
      name: r'userLong',
      type: IsarType.double,
    )
  },
  estimateSize: _orderStatusEstimateSize,
  serialize: _orderStatusSerialize,
  deserialize: _orderStatusDeserialize,
  deserializeProp: _orderStatusDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _orderStatusGetId,
  getLinks: _orderStatusGetLinks,
  attach: _orderStatusAttach,
  version: '3.1.0+1',
);

int _orderStatusEstimateSize(
  OrderStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _orderStatusSerialize(
  OrderStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.price);
  writer.writeLong(offsets[1], object.quantity);
  writer.writeBool(offsets[2], object.statusOrder);
  writer.writeString(offsets[3], object.title);
  writer.writeDouble(offsets[4], object.userLat);
  writer.writeDouble(offsets[5], object.userLong);
}

OrderStatus _orderStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderStatus();
  object.id = id;
  object.price = reader.readDouble(offsets[0]);
  object.quantity = reader.readLong(offsets[1]);
  object.statusOrder = reader.readBool(offsets[2]);
  object.title = reader.readString(offsets[3]);
  object.userLat = reader.readDouble(offsets[4]);
  object.userLong = reader.readDouble(offsets[5]);
  return object;
}

P _orderStatusDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orderStatusGetId(OrderStatus object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orderStatusGetLinks(OrderStatus object) {
  return [];
}

void _orderStatusAttach(
    IsarCollection<dynamic> col, Id id, OrderStatus object) {
  object.id = id;
}

extension OrderStatusQueryWhereSort
    on QueryBuilder<OrderStatus, OrderStatus, QWhere> {
  QueryBuilder<OrderStatus, OrderStatus, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrderStatusQueryWhere
    on QueryBuilder<OrderStatus, OrderStatus, QWhereClause> {
  QueryBuilder<OrderStatus, OrderStatus, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterWhereClause> idBetween(
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

extension OrderStatusQueryFilter
    on QueryBuilder<OrderStatus, OrderStatus, QFilterCondition> {
  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> priceBetween(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> quantityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> quantityBetween(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
      statusOrderEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> userLatEqualTo(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> userLatLessThan(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> userLatBetween(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> userLongEqualTo(
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition>
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

  QueryBuilder<OrderStatus, OrderStatus, QAfterFilterCondition> userLongBetween(
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

extension OrderStatusQueryObject
    on QueryBuilder<OrderStatus, OrderStatus, QFilterCondition> {}

extension OrderStatusQueryLinks
    on QueryBuilder<OrderStatus, OrderStatus, QFilterCondition> {}

extension OrderStatusQuerySortBy
    on QueryBuilder<OrderStatus, OrderStatus, QSortBy> {
  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByStatusOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByStatusOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByUserLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> sortByUserLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.desc);
    });
  }
}

extension OrderStatusQuerySortThenBy
    on QueryBuilder<OrderStatus, OrderStatus, QSortThenBy> {
  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByStatusOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByStatusOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByUserLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.desc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.asc);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QAfterSortBy> thenByUserLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.desc);
    });
  }
}

extension OrderStatusQueryWhereDistinct
    on QueryBuilder<OrderStatus, OrderStatus, QDistinct> {
  QueryBuilder<OrderStatus, OrderStatus, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QDistinct> distinctByStatusOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusOrder');
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QDistinct> distinctByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userLat');
    });
  }

  QueryBuilder<OrderStatus, OrderStatus, QDistinct> distinctByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userLong');
    });
  }
}

extension OrderStatusQueryProperty
    on QueryBuilder<OrderStatus, OrderStatus, QQueryProperty> {
  QueryBuilder<OrderStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrderStatus, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<OrderStatus, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<OrderStatus, bool, QQueryOperations> statusOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusOrder');
    });
  }

  QueryBuilder<OrderStatus, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<OrderStatus, double, QQueryOperations> userLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLat');
    });
  }

  QueryBuilder<OrderStatus, double, QQueryOperations> userLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLong');
    });
  }
}
