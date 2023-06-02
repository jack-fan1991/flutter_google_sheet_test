import 'package:owlmarket_qa_connect/data/item_response.dart';
import 'package:owlmarket_qa_connect/data/result.dart';
import 'package:owlmarket_qa_connect/data/source/data_repository.dart';
import 'package:owlmarket_qa_connect/data/source/data_source.dart';

class DefaultDataRepository extends DataRepository {
  final DataSource local;
  final DataSource remote;

  DefaultDataRepository({required this.local, required this.remote});

  @override
  Future<Result<ItemResponse>> getItem({required int itemId}) {
    return remote.getItem(itemId: itemId);
  }
}
