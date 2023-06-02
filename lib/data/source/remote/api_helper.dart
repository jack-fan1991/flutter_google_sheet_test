import 'dart:convert';

import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

const List<String> userAgents = [
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 13.2; rv:110.0) Gecko/20100101 Firefox/110.0',
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:110.0) Gecko/20100101 Firefox/110.0',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 13_2_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Safari/605.1.15',
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/110.0.1587.63',
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/110.0.1587.63',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 13_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 OPR/96.0.4693.50',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 13_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Vivaldi/5.7.2921.60',
  'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Vivaldi/5.7.2921.60',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 13_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 YaBrowser/23.1.2 Yowser/2.5 Safari/537.36',
];

String getUserAgent() {
  return userAgents[Random().nextInt(10)];
}

class ApiHelper {
  final log = Logger('ApiHelper');
  late final BaseOptions options;

  ApiHelper() {
    setup();
  }

  setup() {
    log.fine('init');
    options = BaseOptions(
      baseUrl: 'https://market.owlting.com/v2/api',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.bytes,
    );
    log.fine('init done');
  }

  Future<dynamic> get(String endpoint,
      [Map<String, dynamic>? queryParams]) async {
    dynamic responseJson;
    try {
      final dio = _allocDio();
      final response = await dio.get(endpoint, queryParameters: queryParams);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getUrl(String url) async {
    dynamic responseData;
    try {
      final response =
          await Dio(BaseOptions(headers: {'User-Agent': getUserAgent()}))
              .get(url);
      responseData = _returnResult(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseData;
  }

  Future<dynamic> post(String endpoint, [Map<String, dynamic>? body]) async {
    dynamic responseJson;
    try {
      final dio = _allocDio();
      final response = await dio.post(endpoint, data: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> patch(String endpoint, [Map<String, dynamic>? body]) async {
    dynamic responseJson;
    try {
      final dio = _allocDio();
      final response = await dio.patch(endpoint, data: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResult(Response response) async {
    switch (response.statusCode) {
      case 200:
        return response.toString();
      default:
        throw Exception(
            'Error occured while Communication with Server: \nstatusCode: ${response.statusCode} \nresponseBody: ${response.statusMessage}');
    }
  }

  dynamic _returnResponse(Response response) async {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(utf8.decode(response.data));
      default:
        throw Exception(
            'Error occured while Communication with Server: \nstatusCode: ${response.statusCode} \nresponseBody: ${response.statusMessage}');
    }
  }

  Dio _allocDio() {
    final dio = Dio(options);
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    // if (debug) {
    // dio.interceptors.add(LogInterceptor(responseBody: true));
    // }
    return dio;
  }
}

Map<String, dynamic> filterOutNulls(Map<String, dynamic> parameters) {
  final Map<String, dynamic> filtered = <String, dynamic>{};

  parameters.forEach((String key, dynamic value) {
    if (value != null) {
      filtered[key] = value;
    }
  });
  return filtered;
}
