// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_sheet_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoogleSheetDataWrapper _$GoogleSheetDataWrapperFromJson(
    Map<String, dynamic> json) {
  return _GoogleSheetDataWrapper.fromJson(json);
}

/// @nodoc
mixin _$GoogleSheetDataWrapper {
  List<GoogleSheetData> get googleSheetData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoogleSheetDataWrapperCopyWith<GoogleSheetDataWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSheetDataWrapperCopyWith<$Res> {
  factory $GoogleSheetDataWrapperCopyWith(GoogleSheetDataWrapper value,
          $Res Function(GoogleSheetDataWrapper) then) =
      _$GoogleSheetDataWrapperCopyWithImpl<$Res, GoogleSheetDataWrapper>;
  @useResult
  $Res call({List<GoogleSheetData> googleSheetData});
}

/// @nodoc
class _$GoogleSheetDataWrapperCopyWithImpl<$Res,
        $Val extends GoogleSheetDataWrapper>
    implements $GoogleSheetDataWrapperCopyWith<$Res> {
  _$GoogleSheetDataWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleSheetData = null,
  }) {
    return _then(_value.copyWith(
      googleSheetData: null == googleSheetData
          ? _value.googleSheetData
          : googleSheetData // ignore: cast_nullable_to_non_nullable
              as List<GoogleSheetData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleSheetDataWrapperCopyWith<$Res>
    implements $GoogleSheetDataWrapperCopyWith<$Res> {
  factory _$$_GoogleSheetDataWrapperCopyWith(_$_GoogleSheetDataWrapper value,
          $Res Function(_$_GoogleSheetDataWrapper) then) =
      __$$_GoogleSheetDataWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GoogleSheetData> googleSheetData});
}

/// @nodoc
class __$$_GoogleSheetDataWrapperCopyWithImpl<$Res>
    extends _$GoogleSheetDataWrapperCopyWithImpl<$Res,
        _$_GoogleSheetDataWrapper>
    implements _$$_GoogleSheetDataWrapperCopyWith<$Res> {
  __$$_GoogleSheetDataWrapperCopyWithImpl(_$_GoogleSheetDataWrapper _value,
      $Res Function(_$_GoogleSheetDataWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleSheetData = null,
  }) {
    return _then(_$_GoogleSheetDataWrapper(
      googleSheetData: null == googleSheetData
          ? _value._googleSheetData
          : googleSheetData // ignore: cast_nullable_to_non_nullable
              as List<GoogleSheetData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoogleSheetDataWrapper extends _GoogleSheetDataWrapper {
  const _$_GoogleSheetDataWrapper(
      {final List<GoogleSheetData> googleSheetData = const []})
      : _googleSheetData = googleSheetData,
        super._();

  factory _$_GoogleSheetDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_GoogleSheetDataWrapperFromJson(json);

  final List<GoogleSheetData> _googleSheetData;
  @override
  @JsonKey()
  List<GoogleSheetData> get googleSheetData {
    if (_googleSheetData is EqualUnmodifiableListView) return _googleSheetData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_googleSheetData);
  }

  @override
  String toString() {
    return 'GoogleSheetDataWrapper(googleSheetData: $googleSheetData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleSheetDataWrapper &&
            const DeepCollectionEquality()
                .equals(other._googleSheetData, _googleSheetData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_googleSheetData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleSheetDataWrapperCopyWith<_$_GoogleSheetDataWrapper> get copyWith =>
      __$$_GoogleSheetDataWrapperCopyWithImpl<_$_GoogleSheetDataWrapper>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoogleSheetDataWrapperToJson(
      this,
    );
  }
}

abstract class _GoogleSheetDataWrapper extends GoogleSheetDataWrapper {
  const factory _GoogleSheetDataWrapper(
          {final List<GoogleSheetData> googleSheetData}) =
      _$_GoogleSheetDataWrapper;
  const _GoogleSheetDataWrapper._() : super._();

  factory _GoogleSheetDataWrapper.fromJson(Map<String, dynamic> json) =
      _$_GoogleSheetDataWrapper.fromJson;

  @override
  List<GoogleSheetData> get googleSheetData;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleSheetDataWrapperCopyWith<_$_GoogleSheetDataWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

GoogleSheetData _$GoogleSheetDataFromJson(Map<String, dynamic> json) {
  return _GoogleSheetData.fromJson(json);
}

/// @nodoc
mixin _$GoogleSheetData {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get availability => throw _privateConstructorUsedError;
  String get imageLink => throw _privateConstructorUsedError;
  String get identifierExists => throw _privateConstructorUsedError;
  String get gtin => throw _privateConstructorUsedError;
  String get mpn => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get googleProductCategory => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoogleSheetDataCopyWith<GoogleSheetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSheetDataCopyWith<$Res> {
  factory $GoogleSheetDataCopyWith(
          GoogleSheetData value, $Res Function(GoogleSheetData) then) =
      _$GoogleSheetDataCopyWithImpl<$Res, GoogleSheetData>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String link,
      String price,
      String availability,
      String imageLink,
      String identifierExists,
      String gtin,
      String mpn,
      String brand,
      String googleProductCategory,
      String language});
}

/// @nodoc
class _$GoogleSheetDataCopyWithImpl<$Res, $Val extends GoogleSheetData>
    implements $GoogleSheetDataCopyWith<$Res> {
  _$GoogleSheetDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? link = null,
    Object? price = null,
    Object? availability = null,
    Object? imageLink = null,
    Object? identifierExists = null,
    Object? gtin = null,
    Object? mpn = null,
    Object? brand = null,
    Object? googleProductCategory = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      identifierExists: null == identifierExists
          ? _value.identifierExists
          : identifierExists // ignore: cast_nullable_to_non_nullable
              as String,
      gtin: null == gtin
          ? _value.gtin
          : gtin // ignore: cast_nullable_to_non_nullable
              as String,
      mpn: null == mpn
          ? _value.mpn
          : mpn // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      googleProductCategory: null == googleProductCategory
          ? _value.googleProductCategory
          : googleProductCategory // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleSheetDataCopyWith<$Res>
    implements $GoogleSheetDataCopyWith<$Res> {
  factory _$$_GoogleSheetDataCopyWith(
          _$_GoogleSheetData value, $Res Function(_$_GoogleSheetData) then) =
      __$$_GoogleSheetDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String link,
      String price,
      String availability,
      String imageLink,
      String identifierExists,
      String gtin,
      String mpn,
      String brand,
      String googleProductCategory,
      String language});
}

/// @nodoc
class __$$_GoogleSheetDataCopyWithImpl<$Res>
    extends _$GoogleSheetDataCopyWithImpl<$Res, _$_GoogleSheetData>
    implements _$$_GoogleSheetDataCopyWith<$Res> {
  __$$_GoogleSheetDataCopyWithImpl(
      _$_GoogleSheetData _value, $Res Function(_$_GoogleSheetData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? link = null,
    Object? price = null,
    Object? availability = null,
    Object? imageLink = null,
    Object? identifierExists = null,
    Object? gtin = null,
    Object? mpn = null,
    Object? brand = null,
    Object? googleProductCategory = null,
    Object? language = null,
  }) {
    return _then(_$_GoogleSheetData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      identifierExists: null == identifierExists
          ? _value.identifierExists
          : identifierExists // ignore: cast_nullable_to_non_nullable
              as String,
      gtin: null == gtin
          ? _value.gtin
          : gtin // ignore: cast_nullable_to_non_nullable
              as String,
      mpn: null == mpn
          ? _value.mpn
          : mpn // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      googleProductCategory: null == googleProductCategory
          ? _value.googleProductCategory
          : googleProductCategory // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoogleSheetData extends _GoogleSheetData {
  const _$_GoogleSheetData(
      {this.id = '',
      this.title = '',
      this.description = '',
      this.link = '',
      this.price = '',
      this.availability = '',
      this.imageLink = '',
      this.identifierExists = '',
      this.gtin = '',
      this.mpn = '',
      this.brand = '',
      this.googleProductCategory = '',
      this.language = ''})
      : super._();

  factory _$_GoogleSheetData.fromJson(Map<String, dynamic> json) =>
      _$$_GoogleSheetDataFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final String availability;
  @override
  @JsonKey()
  final String imageLink;
  @override
  @JsonKey()
  final String identifierExists;
  @override
  @JsonKey()
  final String gtin;
  @override
  @JsonKey()
  final String mpn;
  @override
  @JsonKey()
  final String brand;
  @override
  @JsonKey()
  final String googleProductCategory;
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'GoogleSheetData(id: $id, title: $title, description: $description, link: $link, price: $price, availability: $availability, imageLink: $imageLink, identifierExists: $identifierExists, gtin: $gtin, mpn: $mpn, brand: $brand, googleProductCategory: $googleProductCategory, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleSheetData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.identifierExists, identifierExists) ||
                other.identifierExists == identifierExists) &&
            (identical(other.gtin, gtin) || other.gtin == gtin) &&
            (identical(other.mpn, mpn) || other.mpn == mpn) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.googleProductCategory, googleProductCategory) ||
                other.googleProductCategory == googleProductCategory) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      link,
      price,
      availability,
      imageLink,
      identifierExists,
      gtin,
      mpn,
      brand,
      googleProductCategory,
      language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleSheetDataCopyWith<_$_GoogleSheetData> get copyWith =>
      __$$_GoogleSheetDataCopyWithImpl<_$_GoogleSheetData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoogleSheetDataToJson(
      this,
    );
  }
}

abstract class _GoogleSheetData extends GoogleSheetData {
  const factory _GoogleSheetData(
      {final String id,
      final String title,
      final String description,
      final String link,
      final String price,
      final String availability,
      final String imageLink,
      final String identifierExists,
      final String gtin,
      final String mpn,
      final String brand,
      final String googleProductCategory,
      final String language}) = _$_GoogleSheetData;
  const _GoogleSheetData._() : super._();

  factory _GoogleSheetData.fromJson(Map<String, dynamic> json) =
      _$_GoogleSheetData.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get link;
  @override
  String get price;
  @override
  String get availability;
  @override
  String get imageLink;
  @override
  String get identifierExists;
  @override
  String get gtin;
  @override
  String get mpn;
  @override
  String get brand;
  @override
  String get googleProductCategory;
  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleSheetDataCopyWith<_$_GoogleSheetData> get copyWith =>
      throw _privateConstructorUsedError;
}
