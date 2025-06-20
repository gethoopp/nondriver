// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_status.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeliveryStatusCollection on Isar {
  IsarCollection<DeliveryStatus> get deliveryStatus => this.collection();
}

const DeliveryStatusSchema = CollectionSchema(
  name: r'DeliveryStatus',
  id: 4518557189398963980,
  properties: {
    r'image': PropertySchema(
      id: 0,
      name: r'image',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 1,
      name: r'price',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'statusDeliv': PropertySchema(
      id: 3,
      name: r'statusDeliv',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    ),
    r'userLat': PropertySchema(
      id: 5,
      name: r'userLat',
      type: IsarType.double,
    ),
    r'userLong': PropertySchema(
      id: 6,
      name: r'userLong',
      type: IsarType.double,
    )
  },
  estimateSize: _deliveryStatusEstimateSize,
  serialize: _deliveryStatusSerialize,
  deserialize: _deliveryStatusDeserialize,
  deserializeProp: _deliveryStatusDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _deliveryStatusGetId,
  getLinks: _deliveryStatusGetLinks,
  attach: _deliveryStatusAttach,
  version: '3.1.0+1',
);

int _deliveryStatusEstimateSize(
  DeliveryStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.image.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _deliveryStatusSerialize(
  DeliveryStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.image);
  writer.writeDouble(offsets[1], object.price);
  writer.writeLong(offsets[2], object.quantity);
  writer.writeBool(offsets[3], object.statusDeliv);
  writer.writeString(offsets[4], object.title);
  writer.writeDouble(offsets[5], object.userLat);
  writer.writeDouble(offsets[6], object.userLong);
}

DeliveryStatus _deliveryStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeliveryStatus();
  object.id = id;
  object.image = reader.readString(offsets[0]);
  object.price = reader.readDouble(offsets[1]);
  object.quantity = reader.readLong(offsets[2]);
  object.statusDeliv = reader.readBool(offsets[3]);
  object.title = reader.readString(offsets[4]);
  object.userLat = reader.readDouble(offsets[5]);
  object.userLong = reader.readDouble(offsets[6]);
  return object;
}

P _deliveryStatusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _deliveryStatusGetId(DeliveryStatus object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _deliveryStatusGetLinks(DeliveryStatus object) {
  return [];
}

void _deliveryStatusAttach(
    IsarCollection<dynamic> col, Id id, DeliveryStatus object) {
  object.id = id;
}

extension DeliveryStatusQueryWhereSort
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QWhere> {
  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeliveryStatusQueryWhere
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QWhereClause> {
  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterWhereClause> idBetween(
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

extension DeliveryStatusQueryFilter
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QFilterCondition> {
  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      statusDelivEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusDeliv',
        value: value,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterFilterCondition>
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

extension DeliveryStatusQueryObject
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QFilterCondition> {}

extension DeliveryStatusQueryLinks
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QFilterCondition> {}

extension DeliveryStatusQuerySortBy
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QSortBy> {
  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      sortByStatusDeliv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDeliv', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      sortByStatusDelivDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDeliv', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      sortByUserLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> sortByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      sortByUserLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.desc);
    });
  }
}

extension DeliveryStatusQuerySortThenBy
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QSortThenBy> {
  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      thenByStatusDeliv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDeliv', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      thenByStatusDelivDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDeliv', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      thenByUserLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLat', Sort.desc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy> thenByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.asc);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QAfterSortBy>
      thenByUserLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLong', Sort.desc);
    });
  }
}

extension DeliveryStatusQueryWhereDistinct
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct> {
  QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct>
      distinctByStatusDeliv() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusDeliv');
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct> distinctByUserLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userLat');
    });
  }

  QueryBuilder<DeliveryStatus, DeliveryStatus, QDistinct> distinctByUserLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userLong');
    });
  }
}

extension DeliveryStatusQueryProperty
    on QueryBuilder<DeliveryStatus, DeliveryStatus, QQueryProperty> {
  QueryBuilder<DeliveryStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DeliveryStatus, String, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<DeliveryStatus, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<DeliveryStatus, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<DeliveryStatus, bool, QQueryOperations> statusDelivProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusDeliv');
    });
  }

  QueryBuilder<DeliveryStatus, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<DeliveryStatus, double, QQueryOperations> userLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLat');
    });
  }

  QueryBuilder<DeliveryStatus, double, QQueryOperations> userLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLong');
    });
  }
}
