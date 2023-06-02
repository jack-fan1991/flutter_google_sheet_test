import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_response.g.dart';
part 'item_response.freezed.dart';

@freezed
class ItemResponse with _$ItemResponse {
  const ItemResponse._();
  const factory ItemResponse({
    final Data? data,
  }) = _ItemResponse;
  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const Data._();
  const factory Data({
    final Item? item,
  }) = _Data;
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Item with _$Item {
  const Item._();
  const factory Item({
    @Default(0) final int id,
    @Default('') final String title,
    @Default('') final String name,
    @Default(0) final int price,
    @Default('') final String desc,
    @Default('') final String description,
    @Default(0) @JsonKey(name: 'shipping_days') final int shippingDays,
    @Default(false)
    @JsonKey(name: 'shipping_special')
        final bool shippingSpecial,
    @Default('')
    @JsonKey(name: 'shipping_rule_text')
        final String shippingRuleText,
    @Default(false) @JsonKey(name: 'speedy_shipping') final bool speedyShipping,
    @Default(false)
    @JsonKey(name: 'overseas_shipping')
        final bool overseasShipping,
    @Default(false) @JsonKey(name: 'cod_shipping') final bool codShipping,
    @Default(0) @JsonKey(name: 'order_limit') final int orderLimit,
    @Default(0) @JsonKey(name: 'min_order_limit') final int minOrderLimit,
    @Default(false) final bool isOutOfStock,
    @Default(false) @JsonKey(name: 'can_subscribe') final bool canSubscribe,
    // Parse Null value as dynamic
    @JsonKey(name: 'subscribe_param') final dynamic? subscribeParam,
    @Default(0) @JsonKey(name: 'subscribe_type') final int subscribeType,
    @Default(0) @JsonKey(name: 'original_price') final int originalPrice,
  }) = _Item;
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
