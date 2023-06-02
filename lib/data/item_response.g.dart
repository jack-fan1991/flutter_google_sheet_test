// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemResponse _$$_ItemResponseFromJson(Map<String, dynamic> json) =>
    _$_ItemResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemResponseToJson(_$_ItemResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      item: json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'item': instance.item,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      desc: json['desc'] as String? ?? '',
      description: json['description'] as String? ?? '',
      shippingDays: json['shipping_days'] as int? ?? 0,
      shippingSpecial: json['shipping_special'] as bool? ?? false,
      shippingRuleText: json['shipping_rule_text'] as String? ?? '',
      speedyShipping: json['speedy_shipping'] as bool? ?? false,
      overseasShipping: json['overseas_shipping'] as bool? ?? false,
      codShipping: json['cod_shipping'] as bool? ?? false,
      orderLimit: json['order_limit'] as int? ?? 0,
      minOrderLimit: json['min_order_limit'] as int? ?? 0,
      isOutOfStock: json['isOutOfStock'] as bool? ?? false,
      canSubscribe: json['can_subscribe'] as bool? ?? false,
      subscribeParam: json['subscribe_param'],
      subscribeType: json['subscribe_type'] as int? ?? 0,
      originalPrice: json['original_price'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'price': instance.price,
      'desc': instance.desc,
      'description': instance.description,
      'shipping_days': instance.shippingDays,
      'shipping_special': instance.shippingSpecial,
      'shipping_rule_text': instance.shippingRuleText,
      'speedy_shipping': instance.speedyShipping,
      'overseas_shipping': instance.overseasShipping,
      'cod_shipping': instance.codShipping,
      'order_limit': instance.orderLimit,
      'min_order_limit': instance.minOrderLimit,
      'isOutOfStock': instance.isOutOfStock,
      'can_subscribe': instance.canSubscribe,
      'subscribe_param': instance.subscribeParam,
      'subscribe_type': instance.subscribeType,
      'original_price': instance.originalPrice,
    };
