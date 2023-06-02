// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sheet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoogleSheetDataWrapper _$$_GoogleSheetDataWrapperFromJson(
        Map<String, dynamic> json) =>
    _$_GoogleSheetDataWrapper(
      googleSheetData: (json['googleSheetData'] as List<dynamic>?)
              ?.map((e) => GoogleSheetData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GoogleSheetDataWrapperToJson(
        _$_GoogleSheetDataWrapper instance) =>
    <String, dynamic>{
      'googleSheetData': instance.googleSheetData,
    };

_$_GoogleSheetData _$$_GoogleSheetDataFromJson(Map<String, dynamic> json) =>
    _$_GoogleSheetData(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      link: json['link'] as String? ?? '',
      price: json['price'] as String? ?? '',
      availability: json['availability'] as String? ?? '',
      imageLink: json['imageLink'] as String? ?? '',
      identifierExists: json['identifierExists'] as String? ?? '',
      gtin: json['gtin'] as String? ?? '',
      mpn: json['mpn'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      googleProductCategory: json['googleProductCategory'] as String? ?? '',
      language: json['language'] as String? ?? '',
    );

Map<String, dynamic> _$$_GoogleSheetDataToJson(_$_GoogleSheetData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
      'price': instance.price,
      'availability': instance.availability,
      'imageLink': instance.imageLink,
      'identifierExists': instance.identifierExists,
      'gtin': instance.gtin,
      'mpn': instance.mpn,
      'brand': instance.brand,
      'googleProductCategory': instance.googleProductCategory,
      'language': instance.language,
    };
