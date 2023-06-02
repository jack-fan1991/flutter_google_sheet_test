import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_cubit.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_error_cubit.dart';
import 'package:owlmarket_qa_connect/data/google_sheet_data.dart';
import 'package:owlmarket_qa_connect/data/result.dart';
import 'package:owlmarket_qa_connect/data/source/remote/api_helper.dart';
import 'package:owlmarket_qa_connect/data/item_response.dart';
import 'package:owlmarket_qa_connect/data/source/data_repository.dart';
import 'package:tuple/tuple.dart';

typedef ItemID = int;

class OwlItemServiceCubit extends Cubit<Map<ItemID, Item>> {
  final log = Logger("OwlItemServiceCubit");
  final DataRepository dataRepository;
  final GoogleSheetCubit googleSheetCubit;
  final GoogleSheetErrorCubit googleSheetErrorCubit;
  OwlItemServiceCubit(
    this.dataRepository,
    this.googleSheetCubit,
    this.googleSheetErrorCubit,
  ) : super({});

  Future<void> fetchItem(int itemId) async {
    log.fine('start fetchItem : $itemId');
    final result = await dataRepository.getItem(itemId: itemId);
    result.whenOrNull(
      success: (data) {
        Item serverItem = data.data?.item ??
            Item(
              id: itemId,
              name: 'not found',
              description: 'Cant find item on server',
            );
        final map = state;
        map[itemId] = serverItem;
        emit(map);
        final errorPair = findErrorGoogleData(serverItem);
        if (errorPair != null) {
          googleSheetErrorCubit.updateError(errorPair);
        }
        log.fine('done fetchItem : $itemId');
      },
    );
  }

  void fetchItems(List<int> itemIds) async {
    final futures = <Future>[];
    log.fine('fetchItems : ${itemIds.length}');
    for (final itemId in itemIds) {
      futures.add(fetchItem(itemId));
    }
    await Future.wait(futures);
    assert(state.keys.length == itemIds.length);
    log.fine('All done fetchItems : ${itemIds.length}');
    if (googleSheetErrorCubit.hasError) {
      googleSheetErrorCubit.sendErrorEmail();
    }
  }

  GoogleSheetPairWithServerData? assertServerData(
      Item serverItem, GoogleSheetData googleSheetData) {
    log.fine('---------------------------------------');
    log.fine('assertServerData : ${googleSheetData.title}');
    bool hasError = false;

    if (serverItem.price != googleSheetData.priceToServerFmt) {
      log.severe(
          'price not match : server => ${serverItem.price} , google => ${googleSheetData.price}');
      hasError = true;
    }
    if (serverItem.isOutOfStock != googleSheetData.availabilityToServerFmt) {
      log.severe(
          'isOutOfStock not match : server => ${serverItem.isOutOfStock} , google => ${googleSheetData.availability}');
      hasError = true;
    }
    if (hasError) {
      return GoogleSheetPairWithServerData(googleSheetData, serverItem);
    } else {
      log.fine('-----------------Pass----------------------');
      return null;
    }
  }

  GoogleSheetPairWithServerData? findErrorGoogleData(Item serverItem) =>
      googleSheetCubit.doIfLoaded<GoogleSheetPairWithServerData?>(
        (googleSheetDataWrapper) {
          final errorData = googleSheetDataWrapper.totalDisplayData
              .where((googleSheetData) =>
                  googleSheetData.id == serverItem.id.toString())
              .map((googleSheetData) =>
                  assertServerData(serverItem, googleSheetData))
              .toList();
          if (errorData.isNotEmpty) {
            assert(errorData.length == 1);
            return errorData.first;
          } else {
            return null;
          }
        },
      );
}
