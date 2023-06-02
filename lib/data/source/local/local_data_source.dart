import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/data/item_response.dart';
import 'package:owlmarket_qa_connect/data/source/data_source.dart';
import 'package:owlmarket_qa_connect/data/result.dart';

class LocalDataSource extends DataSource {
  final log = Logger('LocalDataSource');

  LocalDataSource();

  @override
  Future<Result<ItemResponse>> getItem({required int itemId}) {
    throw UnimplementedError();
  }
}
