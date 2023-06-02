// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) {
  return _ItemResponse.fromJson(json);
}

/// @nodoc
mixin _$ItemResponse {
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemResponseCopyWith<ItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemResponseCopyWith<$Res> {
  factory $ItemResponseCopyWith(
          ItemResponse value, $Res Function(ItemResponse) then) =
      _$ItemResponseCopyWithImpl<$Res, ItemResponse>;
  @useResult
  $Res call({Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ItemResponseCopyWithImpl<$Res, $Val extends ItemResponse>
    implements $ItemResponseCopyWith<$Res> {
  _$ItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItemResponseCopyWith<$Res>
    implements $ItemResponseCopyWith<$Res> {
  factory _$$_ItemResponseCopyWith(
          _$_ItemResponse value, $Res Function(_$_ItemResponse) then) =
      __$$_ItemResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ItemResponseCopyWithImpl<$Res>
    extends _$ItemResponseCopyWithImpl<$Res, _$_ItemResponse>
    implements _$$_ItemResponseCopyWith<$Res> {
  __$$_ItemResponseCopyWithImpl(
      _$_ItemResponse _value, $Res Function(_$_ItemResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_ItemResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemResponse extends _ItemResponse {
  const _$_ItemResponse({this.data}) : super._();

  factory _$_ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ItemResponseFromJson(json);

  @override
  final Data? data;

  @override
  String toString() {
    return 'ItemResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemResponseCopyWith<_$_ItemResponse> get copyWith =>
      __$$_ItemResponseCopyWithImpl<_$_ItemResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemResponseToJson(
      this,
    );
  }
}

abstract class _ItemResponse extends ItemResponse {
  const factory _ItemResponse({final Data? data}) = _$_ItemResponse;
  const _ItemResponse._() : super._();

  factory _ItemResponse.fromJson(Map<String, dynamic> json) =
      _$_ItemResponse.fromJson;

  @override
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ItemResponseCopyWith<_$_ItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  Item? get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({Item? item});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Item? item});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_Data(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data extends _Data {
  const _$_Data({this.item}) : super._();

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final Item? item;

  @override
  String toString() {
    return 'Data(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data extends Data {
  const factory _Data({final Item? item}) = _$_Data;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  Item? get item;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_days')
  int get shippingDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_special')
  bool get shippingSpecial => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_rule_text')
  String get shippingRuleText => throw _privateConstructorUsedError;
  @JsonKey(name: 'speedy_shipping')
  bool get speedyShipping => throw _privateConstructorUsedError;
  @JsonKey(name: 'overseas_shipping')
  bool get overseasShipping => throw _privateConstructorUsedError;
  @JsonKey(name: 'cod_shipping')
  bool get codShipping => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_limit')
  int get orderLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_order_limit')
  int get minOrderLimit => throw _privateConstructorUsedError;
  bool get isOutOfStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_subscribe')
  bool get canSubscribe =>
      throw _privateConstructorUsedError; // Parse Null value as dynamic
  @JsonKey(name: 'subscribe_param')
  dynamic? get subscribeParam => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscribe_type')
  int get subscribeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_price')
  int get originalPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {int id,
      String title,
      String name,
      int price,
      String desc,
      String description,
      @JsonKey(name: 'shipping_days') int shippingDays,
      @JsonKey(name: 'shipping_special') bool shippingSpecial,
      @JsonKey(name: 'shipping_rule_text') String shippingRuleText,
      @JsonKey(name: 'speedy_shipping') bool speedyShipping,
      @JsonKey(name: 'overseas_shipping') bool overseasShipping,
      @JsonKey(name: 'cod_shipping') bool codShipping,
      @JsonKey(name: 'order_limit') int orderLimit,
      @JsonKey(name: 'min_order_limit') int minOrderLimit,
      bool isOutOfStock,
      @JsonKey(name: 'can_subscribe') bool canSubscribe,
      @JsonKey(name: 'subscribe_param') dynamic? subscribeParam,
      @JsonKey(name: 'subscribe_type') int subscribeType,
      @JsonKey(name: 'original_price') int originalPrice});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? name = null,
    Object? price = null,
    Object? desc = null,
    Object? description = null,
    Object? shippingDays = null,
    Object? shippingSpecial = null,
    Object? shippingRuleText = null,
    Object? speedyShipping = null,
    Object? overseasShipping = null,
    Object? codShipping = null,
    Object? orderLimit = null,
    Object? minOrderLimit = null,
    Object? isOutOfStock = null,
    Object? canSubscribe = null,
    Object? subscribeParam = freezed,
    Object? subscribeType = null,
    Object? originalPrice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shippingDays: null == shippingDays
          ? _value.shippingDays
          : shippingDays // ignore: cast_nullable_to_non_nullable
              as int,
      shippingSpecial: null == shippingSpecial
          ? _value.shippingSpecial
          : shippingSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingRuleText: null == shippingRuleText
          ? _value.shippingRuleText
          : shippingRuleText // ignore: cast_nullable_to_non_nullable
              as String,
      speedyShipping: null == speedyShipping
          ? _value.speedyShipping
          : speedyShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      overseasShipping: null == overseasShipping
          ? _value.overseasShipping
          : overseasShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      codShipping: null == codShipping
          ? _value.codShipping
          : codShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      orderLimit: null == orderLimit
          ? _value.orderLimit
          : orderLimit // ignore: cast_nullable_to_non_nullable
              as int,
      minOrderLimit: null == minOrderLimit
          ? _value.minOrderLimit
          : minOrderLimit // ignore: cast_nullable_to_non_nullable
              as int,
      isOutOfStock: null == isOutOfStock
          ? _value.isOutOfStock
          : isOutOfStock // ignore: cast_nullable_to_non_nullable
              as bool,
      canSubscribe: null == canSubscribe
          ? _value.canSubscribe
          : canSubscribe // ignore: cast_nullable_to_non_nullable
              as bool,
      subscribeParam: freezed == subscribeParam
          ? _value.subscribeParam
          : subscribeParam // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      subscribeType: null == subscribeType
          ? _value.subscribeType
          : subscribeType // ignore: cast_nullable_to_non_nullable
              as int,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String name,
      int price,
      String desc,
      String description,
      @JsonKey(name: 'shipping_days') int shippingDays,
      @JsonKey(name: 'shipping_special') bool shippingSpecial,
      @JsonKey(name: 'shipping_rule_text') String shippingRuleText,
      @JsonKey(name: 'speedy_shipping') bool speedyShipping,
      @JsonKey(name: 'overseas_shipping') bool overseasShipping,
      @JsonKey(name: 'cod_shipping') bool codShipping,
      @JsonKey(name: 'order_limit') int orderLimit,
      @JsonKey(name: 'min_order_limit') int minOrderLimit,
      bool isOutOfStock,
      @JsonKey(name: 'can_subscribe') bool canSubscribe,
      @JsonKey(name: 'subscribe_param') dynamic? subscribeParam,
      @JsonKey(name: 'subscribe_type') int subscribeType,
      @JsonKey(name: 'original_price') int originalPrice});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? name = null,
    Object? price = null,
    Object? desc = null,
    Object? description = null,
    Object? shippingDays = null,
    Object? shippingSpecial = null,
    Object? shippingRuleText = null,
    Object? speedyShipping = null,
    Object? overseasShipping = null,
    Object? codShipping = null,
    Object? orderLimit = null,
    Object? minOrderLimit = null,
    Object? isOutOfStock = null,
    Object? canSubscribe = null,
    Object? subscribeParam = freezed,
    Object? subscribeType = null,
    Object? originalPrice = null,
  }) {
    return _then(_$_Item(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shippingDays: null == shippingDays
          ? _value.shippingDays
          : shippingDays // ignore: cast_nullable_to_non_nullable
              as int,
      shippingSpecial: null == shippingSpecial
          ? _value.shippingSpecial
          : shippingSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingRuleText: null == shippingRuleText
          ? _value.shippingRuleText
          : shippingRuleText // ignore: cast_nullable_to_non_nullable
              as String,
      speedyShipping: null == speedyShipping
          ? _value.speedyShipping
          : speedyShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      overseasShipping: null == overseasShipping
          ? _value.overseasShipping
          : overseasShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      codShipping: null == codShipping
          ? _value.codShipping
          : codShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      orderLimit: null == orderLimit
          ? _value.orderLimit
          : orderLimit // ignore: cast_nullable_to_non_nullable
              as int,
      minOrderLimit: null == minOrderLimit
          ? _value.minOrderLimit
          : minOrderLimit // ignore: cast_nullable_to_non_nullable
              as int,
      isOutOfStock: null == isOutOfStock
          ? _value.isOutOfStock
          : isOutOfStock // ignore: cast_nullable_to_non_nullable
              as bool,
      canSubscribe: null == canSubscribe
          ? _value.canSubscribe
          : canSubscribe // ignore: cast_nullable_to_non_nullable
              as bool,
      subscribeParam: freezed == subscribeParam
          ? _value.subscribeParam
          : subscribeParam // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      subscribeType: null == subscribeType
          ? _value.subscribeType
          : subscribeType // ignore: cast_nullable_to_non_nullable
              as int,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item extends _Item {
  const _$_Item(
      {this.id = 0,
      this.title = '',
      this.name = '',
      this.price = 0,
      this.desc = '',
      this.description = '',
      @JsonKey(name: 'shipping_days') this.shippingDays = 0,
      @JsonKey(name: 'shipping_special') this.shippingSpecial = false,
      @JsonKey(name: 'shipping_rule_text') this.shippingRuleText = '',
      @JsonKey(name: 'speedy_shipping') this.speedyShipping = false,
      @JsonKey(name: 'overseas_shipping') this.overseasShipping = false,
      @JsonKey(name: 'cod_shipping') this.codShipping = false,
      @JsonKey(name: 'order_limit') this.orderLimit = 0,
      @JsonKey(name: 'min_order_limit') this.minOrderLimit = 0,
      this.isOutOfStock = false,
      @JsonKey(name: 'can_subscribe') this.canSubscribe = false,
      @JsonKey(name: 'subscribe_param') this.subscribeParam,
      @JsonKey(name: 'subscribe_type') this.subscribeType = 0,
      @JsonKey(name: 'original_price') this.originalPrice = 0})
      : super._();

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String desc;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'shipping_days')
  final int shippingDays;
  @override
  @JsonKey(name: 'shipping_special')
  final bool shippingSpecial;
  @override
  @JsonKey(name: 'shipping_rule_text')
  final String shippingRuleText;
  @override
  @JsonKey(name: 'speedy_shipping')
  final bool speedyShipping;
  @override
  @JsonKey(name: 'overseas_shipping')
  final bool overseasShipping;
  @override
  @JsonKey(name: 'cod_shipping')
  final bool codShipping;
  @override
  @JsonKey(name: 'order_limit')
  final int orderLimit;
  @override
  @JsonKey(name: 'min_order_limit')
  final int minOrderLimit;
  @override
  @JsonKey()
  final bool isOutOfStock;
  @override
  @JsonKey(name: 'can_subscribe')
  final bool canSubscribe;
// Parse Null value as dynamic
  @override
  @JsonKey(name: 'subscribe_param')
  final dynamic? subscribeParam;
  @override
  @JsonKey(name: 'subscribe_type')
  final int subscribeType;
  @override
  @JsonKey(name: 'original_price')
  final int originalPrice;

  @override
  String toString() {
    return 'Item(id: $id, title: $title, name: $name, price: $price, desc: $desc, description: $description, shippingDays: $shippingDays, shippingSpecial: $shippingSpecial, shippingRuleText: $shippingRuleText, speedyShipping: $speedyShipping, overseasShipping: $overseasShipping, codShipping: $codShipping, orderLimit: $orderLimit, minOrderLimit: $minOrderLimit, isOutOfStock: $isOutOfStock, canSubscribe: $canSubscribe, subscribeParam: $subscribeParam, subscribeType: $subscribeType, originalPrice: $originalPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shippingDays, shippingDays) ||
                other.shippingDays == shippingDays) &&
            (identical(other.shippingSpecial, shippingSpecial) ||
                other.shippingSpecial == shippingSpecial) &&
            (identical(other.shippingRuleText, shippingRuleText) ||
                other.shippingRuleText == shippingRuleText) &&
            (identical(other.speedyShipping, speedyShipping) ||
                other.speedyShipping == speedyShipping) &&
            (identical(other.overseasShipping, overseasShipping) ||
                other.overseasShipping == overseasShipping) &&
            (identical(other.codShipping, codShipping) ||
                other.codShipping == codShipping) &&
            (identical(other.orderLimit, orderLimit) ||
                other.orderLimit == orderLimit) &&
            (identical(other.minOrderLimit, minOrderLimit) ||
                other.minOrderLimit == minOrderLimit) &&
            (identical(other.isOutOfStock, isOutOfStock) ||
                other.isOutOfStock == isOutOfStock) &&
            (identical(other.canSubscribe, canSubscribe) ||
                other.canSubscribe == canSubscribe) &&
            const DeepCollectionEquality()
                .equals(other.subscribeParam, subscribeParam) &&
            (identical(other.subscribeType, subscribeType) ||
                other.subscribeType == subscribeType) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        name,
        price,
        desc,
        description,
        shippingDays,
        shippingSpecial,
        shippingRuleText,
        speedyShipping,
        overseasShipping,
        codShipping,
        orderLimit,
        minOrderLimit,
        isOutOfStock,
        canSubscribe,
        const DeepCollectionEquality().hash(subscribeParam),
        subscribeType,
        originalPrice
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item extends Item {
  const factory _Item(
      {final int id,
      final String title,
      final String name,
      final int price,
      final String desc,
      final String description,
      @JsonKey(name: 'shipping_days') final int shippingDays,
      @JsonKey(name: 'shipping_special') final bool shippingSpecial,
      @JsonKey(name: 'shipping_rule_text') final String shippingRuleText,
      @JsonKey(name: 'speedy_shipping') final bool speedyShipping,
      @JsonKey(name: 'overseas_shipping') final bool overseasShipping,
      @JsonKey(name: 'cod_shipping') final bool codShipping,
      @JsonKey(name: 'order_limit') final int orderLimit,
      @JsonKey(name: 'min_order_limit') final int minOrderLimit,
      final bool isOutOfStock,
      @JsonKey(name: 'can_subscribe') final bool canSubscribe,
      @JsonKey(name: 'subscribe_param') final dynamic? subscribeParam,
      @JsonKey(name: 'subscribe_type') final int subscribeType,
      @JsonKey(name: 'original_price') final int originalPrice}) = _$_Item;
  const _Item._() : super._();

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get name;
  @override
  int get price;
  @override
  String get desc;
  @override
  String get description;
  @override
  @JsonKey(name: 'shipping_days')
  int get shippingDays;
  @override
  @JsonKey(name: 'shipping_special')
  bool get shippingSpecial;
  @override
  @JsonKey(name: 'shipping_rule_text')
  String get shippingRuleText;
  @override
  @JsonKey(name: 'speedy_shipping')
  bool get speedyShipping;
  @override
  @JsonKey(name: 'overseas_shipping')
  bool get overseasShipping;
  @override
  @JsonKey(name: 'cod_shipping')
  bool get codShipping;
  @override
  @JsonKey(name: 'order_limit')
  int get orderLimit;
  @override
  @JsonKey(name: 'min_order_limit')
  int get minOrderLimit;
  @override
  bool get isOutOfStock;
  @override
  @JsonKey(name: 'can_subscribe')
  bool get canSubscribe;
  @override // Parse Null value as dynamic
  @JsonKey(name: 'subscribe_param')
  dynamic? get subscribeParam;
  @override
  @JsonKey(name: 'subscribe_type')
  int get subscribeType;
  @override
  @JsonKey(name: 'original_price')
  int get originalPrice;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
