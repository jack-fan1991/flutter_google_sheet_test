import 'package:owlmarket_qa_connect/data/item_response.dart';
import 'package:owlmarket_qa_connect/data/result.dart';

abstract class DataRepository {
  Future<Result<ItemResponse>> getItem({required int itemId});
}
