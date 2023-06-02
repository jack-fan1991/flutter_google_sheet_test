import 'package:freezed_annotation/freezed_annotation.dart';
part 'google_sheet_data.g.dart';
part 'google_sheet_data.freezed.dart';

@freezed
class GoogleSheetDataWrapper with _$GoogleSheetDataWrapper {
  const GoogleSheetDataWrapper._();
  const factory GoogleSheetDataWrapper({
    @Default([]) final List<GoogleSheetData> googleSheetData,
  }) = _GoogleSheetDataWrapper;
  factory GoogleSheetDataWrapper.fromJson(List<dynamic> jsonArray) =>
      _$GoogleSheetDataWrapperFromJson({"googleSheetData": jsonArray});
}

@freezed
class GoogleSheetData with _$GoogleSheetData {
  const GoogleSheetData._();
  const factory GoogleSheetData({
    @Default('') final String id,
    @Default('') final String title,
    @Default('') final String description,
    @Default('') final String link,
    @Default('') final String price,
    @Default('') final String availability,
    @Default('') final String imageLink,
    @Default('') final String identifierExists,
    @Default('') final String gtin,
    @Default('') final String mpn,
    @Default('') final String brand,
    @Default('') final String googleProductCategory,
    @Default('') final String language,
  }) = _GoogleSheetData;
  factory GoogleSheetData.fromJson(Map<String, dynamic> json) =>
      _$GoogleSheetDataFromJson(json);
}
