// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_order.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotifcaitonOrderStatusCollection on Isar {
  IsarCollection<NotifcaitonOrderStatus> get notifcaitonOrderStatus =>
      this.collection();
}

const NotifcaitonOrderStatusSchema = CollectionSchema(
  name: r'NotifcaitonOrderStatus',
  id: -2568079149199296204,
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
    )
  },
  estimateSize: _notifcaitonOrderStatusEstimateSize,
  serialize: _notifcaitonOrderStatusSerialize,
  deserialize: _notifcaitonOrderStatusDeserialize,
  deserializeProp: _notifcaitonOrderStatusDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _notifcaitonOrderStatusGetId,
  getLinks: _notifcaitonOrderStatusGetLinks,
  attach: _notifcaitonOrderStatusAttach,
  version: '3.1.0+1',
);

int _notifcaitonOrderStatusEstimateSize(
  NotifcaitonOrderStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _notifcaitonOrderStatusSerialize(
  NotifcaitonOrderStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.price);
  writer.writeLong(offsets[1], object.quantity);
  writer.writeBool(offsets[2], object.statusOrder);
  writer.writeString(offsets[3], object.title);
}

NotifcaitonOrderStatus _notifcaitonOrderStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotifcaitonOrderStatus();
  object.id = id;
  object.price = reader.readDouble(offsets[0]);
  object.quantity = reader.readLong(offsets[1]);
  object.statusOrder = reader.readBool(offsets[2]);
  object.title = reader.readString(offsets[3]);
  return object;
}

P _notifcaitonOrderStatusDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notifcaitonOrderStatusGetId(NotifcaitonOrderStatus object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notifcaitonOrderStatusGetLinks(
    NotifcaitonOrderStatus object) {
  return [];
}

void _notifcaitonOrderStatusAttach(
    IsarCollection<dynamic> col, Id id, NotifcaitonOrderStatus object) {
  object.id = id;
}

extension NotifcaitonOrderStatusQueryWhereSort
    on QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QWhere> {
  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotifcaitonOrderStatusQueryWhere on QueryBuilder<
    NotifcaitonOrderStatus, NotifcaitonOrderStatus, QWhereClause> {
  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterWhereClause> idBetween(
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

extension NotifcaitonOrderStatusQueryFilter on QueryBuilder<
    NotifcaitonOrderStatus, NotifcaitonOrderStatus, QFilterCondition> {
  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> priceGreaterThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> priceBetween(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> quantityGreaterThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> quantityLessThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> quantityBetween(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> statusOrderEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleBetween(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension NotifcaitonOrderStatusQueryObject on QueryBuilder<
    NotifcaitonOrderStatus, NotifcaitonOrderStatus, QFilterCondition> {}

extension NotifcaitonOrderStatusQueryLinks on QueryBuilder<
    NotifcaitonOrderStatus, NotifcaitonOrderStatus, QFilterCondition> {}

extension NotifcaitonOrderStatusQuerySortBy
    on QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QSortBy> {
  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByStatusOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByStatusOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.desc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension NotifcaitonOrderStatusQuerySortThenBy on QueryBuilder<
    NotifcaitonOrderStatus, NotifcaitonOrderStatus, QSortThenBy> {
  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByStatusOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByStatusOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOrder', Sort.desc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension NotifcaitonOrderStatusQueryWhereDistinct
    on QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QDistinct> {
  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QDistinct>
      distinctByStatusOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusOrder');
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, NotifcaitonOrderStatus, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension NotifcaitonOrderStatusQueryProperty on QueryBuilder<
    NotifcaitonOrderStatus, NotifcaitonOrderStatus, QQueryProperty> {
  QueryBuilder<NotifcaitonOrderStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, double, QQueryOperations>
      priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, int, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, bool, QQueryOperations>
      statusOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusOrder');
    });
  }

  QueryBuilder<NotifcaitonOrderStatus, String, QQueryOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
