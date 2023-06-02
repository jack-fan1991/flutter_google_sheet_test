import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsheets/gsheets.dart';
import 'package:owlmarket_qa_connect/bloc/bloc_state.dart';
import 'package:owlmarket_qa_connect/data/google_sheet_data.dart';
import 'package:owlmarket_qa_connect/main.dart';
import 'package:owlmarket_qa_connect/utils/common.dart';

extension GoogleSheetDataWrapperHelper on GoogleSheetDataWrapper {
  List<String> get displayHeaders =>
      googleSheetData.first.toJson().keys.toList();

  List<GoogleSheetData> get totalDisplayData =>
      googleSheetData.skip(1).toList();

  List<GoogleSheetData> takeData({int from = 0, int take = 99999}) =>
      totalDisplayData.skip(from).take(take).toList();
}

extension GoogleSheetDataHelper on GoogleSheetData {
  int get priceToServerFmt =>
      int.tryParse(price.toUpperCase().replaceAll("TWD", "").trim()) ?? -1;
  bool get availabilityToServerFmt => availability == 'out_of_stock';
}

class GoogleSheetCubit
    extends Cubit<BlocState<GoogleSheetDataWrapper, Exception>> {
  GoogleSheetCubit() : super(const BlocState.loading());

  Future<void> fetchData() async {
    emit(const BlocState.loading());
    try {
      final gsheets = GSheets(credentials);
      final ss = await gsheets.spreadsheet(App.spreadsheedId);
      final sheet = ss.worksheetByTitle("工作表1");
      final data = await sheet!.values.allRows();
      final titles = data.first;
      final List<dynamic> list = [];
      for (final d in data.take(5)) {
        final map = <String, dynamic>{};
        for (var i = 0; i < titles.length; i++) {
          map[titles[i]] = d[i];
        }
        list.add(map);
      }
      final dataWrapper = GoogleSheetDataWrapper.fromJson(list);
      emit(BlocState.loaded(dataWrapper));
    } catch (e) {
      emit(BlocState.error(e as Exception));
    }
  }

  T doIfLoaded<T>(T Function(GoogleSheetDataWrapper) f) {
    return state.maybeWhen(
      loaded: (data) {
        return f(data);
      },
      orElse: () => throw Exception('Not loaded yet'),
    );
  }
}
