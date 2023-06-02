import 'package:owlmarket_qa_connect/data/item_response.dart';
import 'package:owlmarket_qa_connect/data/result.dart';

abstract class DataSource {
  Future<Result<ItemResponse>> getItem({required int itemId});
}
