import 'package:dio/dio.dart';
import 'package:owlmarket_qa_connect/data/source/remote/api_helper.dart';

class FirebaseFunctionsHelper extends ApiHelper {
  final bool isDebug;
  FirebaseFunctionsHelper({required this.isDebug}) : super();
  String get baseUrl => isDebug
      ? 'http://localhost:5001/owlmarket-qa-connect/us-central1'
      : 'https://us-central1-owlmarket-qa.cloudfunctions.net';

  List<String> recipient = ["jack_fan@owlting.com"];
  @override
  setup() {
    log.fine('init');
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.bytes,
    );
    log.fine('init done');
  }

  /// sample
  /// ```
  /// body
  /// {
  ///     "recipient": ["jack11jack11jack@gmail.com","jack_fan@owlting.com"],
  ///     "subject": "Test From postman",
  ///     "text": "Test From postman."
  ///}
  ///
  /// ```
  Future<dynamic> sendMail(String text) {
    final body = {
      'recipient': recipient,
      'subject': '[OwlMarket product stock] Find some product different',
      'text': text
    };
    return post('/sendMail', body);
  }
}
