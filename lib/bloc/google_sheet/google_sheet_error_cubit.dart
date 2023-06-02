import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_cubit.dart';
import 'package:owlmarket_qa_connect/data/google_sheet_data.dart';
import 'package:owlmarket_qa_connect/data/item_response.dart';
import 'package:owlmarket_qa_connect/utils/firebase_functions_helper.dart';
import 'package:tuple/tuple.dart';

typedef GoogleSheetPairWithServerData = Tuple2<GoogleSheetData, Item>;

enum ErrorType {
  price,
  availability,
}

class GoogleSheetErrorCubit
    extends Cubit<Map<String, GoogleSheetPairWithServerData>> {
  final log = Logger('GoogleSheetErrorCubit');
  final FirebaseFunctionsHelper firebaseFunctionsHelper;
  GoogleSheetErrorCubit(this.firebaseFunctionsHelper) : super({});

  get hasError => state.isNotEmpty;

  /// return Correct data in server
  String? validator(
      {required String key, required GoogleSheetData googleSheetData}) {
    log.fine('validator key : $key, data : ${googleSheetData.title}');
    log.fine(
        'price : ${googleSheetData.price}, availability : ${googleSheetData.availability}');
    final errData = state[googleSheetData.id];
    if (errData == null) {
      return null;
    }
    final serverData = errData.item2;
    switch (key) {
      case 'price':
        if (serverData.price != googleSheetData.priceToServerFmt) {
          return serverData.price.toString();
        }
        return null;
      case 'availability':
        if (serverData.isOutOfStock !=
            googleSheetData.availabilityToServerFmt) {
          return serverData.isOutOfStock ? 'out_of_stock' : 'in_stock';
        }
        return null;
    }
    return null;
  }

  void updateError(GoogleSheetPairWithServerData dataPair) {
    final map = state;
    final newMap = Map<String, GoogleSheetPairWithServerData>.from(map);
    newMap[dataPair.item1.id] = dataPair;
    emit(newMap);
  }

  String addMsg(key,
      {required GoogleSheetData googleSheetData, required Item serverItem}) {
    final valid = validator(key: key, googleSheetData: googleSheetData);
    return valid == null
        ? ''
        : '* price : [Server] ${serverItem.price} -> [Google sheet] ${googleSheetData.price}';
  }

  String addAvailabilityMsg(
      {required GoogleSheetData googleSheetData, required Item serverItem}) {
    final valid =
        validator(key: 'availability', googleSheetData: googleSheetData);
    return valid == null
        ? ''
        : '[Server] ${serverItem.isOutOfStock ? 'out_of_stock' : 'in_stock'} -> [Google sheet] ${googleSheetData.availability}';
  }

  Future<void> sendErrorEmail() async {
    final text = state.entries.map((e) {
      final serverData = e.value.item2;
      final googleSheetData = e.value.item1;
      return '''
      Different:
        * ${serverData.id} : ${serverData.name}
        ${addMsg('price', googleSheetData: googleSheetData, serverItem: serverData)}')}
        ${addAvailabilityMsg(googleSheetData: googleSheetData, serverItem: serverData)}')}
      ''';
    }).join('\n');
    log.fine(text);
    final result = firebaseFunctionsHelper.sendMail(text);
    log.fine('send mail result : $result');
  }

  // @override
  // void onChange(Change<Map<String, GoogleSheetData>> change) {
  //   super.onChange(change);
  //   log.info('current state : $state, change : $change');
  // }
}
