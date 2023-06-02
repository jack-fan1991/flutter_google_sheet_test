import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/data/item_response.dart';

import 'package:owlmarket_qa_connect/data/result.dart';
import 'package:owlmarket_qa_connect/data/source/data_source.dart';
import 'package:owlmarket_qa_connect/data/source/remote/api_helper.dart';

class RemoteDataSource extends DataSource {
  final log = Logger('RemoteDataSource');
  final ApiHelper apiHelper;

  RemoteDataSource({required this.apiHelper});

  Future<Result<T>> recordErrorThanReturn<T>(
      {required String message, dynamic e, StackTrace? s}) async {
    late final Exception ex;
    switch (e.runtimeType) {
      case Error:
        ex = Exception((e as Error).toString());
        break;
      case Exception:
        ex = e;
        break;
      default:
        ex = Exception(message);
        break;
    }

    log.severe(
        '\n----- EXCEPTION FROM REMOTE DATA SOURCE -----\n$message \n$e \n$s\n---------------------------------------------');
    return Result.error(ex);
  }

  @override
  Future<Result<ItemResponse>> getItem({required int itemId}) async {
    try {
      final result = await apiHelper.get(
        '/public/item/$itemId',
      );

      final itemResponse = ItemResponse.fromJson(result);
      return Result.success(itemResponse);
    } catch (e, s) {
      final errorMsg = 'Failed to get purchase $e $s';
      log.severe(errorMsg);
      return await recordErrorThanReturn(message: errorMsg, e: e, s: s);
    }
  }
}
