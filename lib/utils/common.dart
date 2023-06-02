import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const credentials = r'''
{
  "type": "service_account",
  "project_id": "owlmarket-1d13c",
  "private_key_id": "883b0fe666f9042765726a058f9d8335b95b9f37",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDvIyfrORaQBSKQ\nMeCE23FrsbDmzD5ibEKvshk8cesb9nKA5Pd+38zsU3uzZKYK8xzKRQUQelG2HfPw\nAchkqOTiKSZoY2DYYWh0vbusudxEJBF7E0xU3lTAbiM4p0aW9xqqwzlNJFlwVlym\nAMVpI9JXKMbH3H/q2k69utMjail9XmWvgff28jhhVnIYGcv8AJZwjj8MbD5sQk3J\nIggdG4WFcUExASfoAriL4hZDCpGPzsshR2BYKciATCfE9LFp4ZH5mXnbPKIztyrz\nXpE5BtQD5As9++chOzdO+vGrdZSlp86hTZBl5qklF0Nj9kK9qJHvZDNrZou/NRiJ\nMcASYD4zAgMBAAECggEAG9nLqQ40XdWbRDvq2s5L6VpVMKwSNULyiU/ZYebKllkf\ngM9/MPGTsOUQKmvLGB9e960OJ/B3BRomnN84SDDmEfOaRjISHLag2b0h1xNWX0FB\ndUS2xnOWX0r0eIFS1qY0yYqEaULrKmAvLiOM2kU9FsA9q8KMdf0INU9FjoGrZK7u\nIuvlNuBLi+Lqxda0zDU0lSN3Hvg2duQJaPYmdYPjau6TT/AkIsf31eodbgyncytr\nTmaKWFBssys1J7s9hzrsScHdD4pg9T7umACngCHTIh+1M0G7PplMwmC9TQwZhbVN\nGDnCaaVKskaLj0jZvI6IUiCrEa51JondgCtJv0/ysQKBgQD8FwRw52s15gdUPpYx\n3AHcdovV3/0hkY3ZsuIpbprnKxGohw3gT/eO5T36/fTukRdqdETBZodnj/cFmAA9\nW4b6TkLFCelg9EIysB5z6UM28QZDggGX7puZtP0JJMkYrZhZOwqA7KIPkKjIDXxa\nje7NKgqTAmPi09if5d7NWVjN7wKBgQDy2LUQulRqyP6e6KWc2Dge2oClmSBKTDAG\n+y+toozuFXALjgp8pUyzncQJSXEg3ZJsQ61hvPkUR6bNx5sgoyrHz1sKAcxXD76K\nJyWRREV15pC0m0GTipHRk7m4kiog5yxdlFyvnSSz+qoqjoTftaGAPNTQBnxQsrBu\njW3wgufX/QKBgQDI/h0nXAxKDB7Z15DvLgg53DcADrgHtMLRyWOzPyG4oMlSgmPY\n7klmoHa7kRJhyENQOGW9gd8B/nIo/plqUnibSBzKd22hRP8m5O9S4bAatS+WUait\nl6xucDSzvqWrzHVE5+MnCgToviEkaEQ2+yVkZVnK/sPfTaNRUflD5zH79wKBgHzW\nfi39O0wxywKxogFA/YiO1rdKQlkvVTkhg18FQuFZT+IAwM9WwllLbu0/PdKhVJYn\nLEgkNv7/3nXGeK6Mcn+IzsoUJpFS3KZ0fVFyASscvaK6dTl9cHyGLmD9cn67mAj7\nLbJxW97Rqwx5e0DtQ/qCSvwteVaapSwPtEaBZOGZAoGARyMDDMB22lZxtl4kW7zI\nu4jzQj7oHmEMhhQGe1wF88/0MJy9LNmYuxnYgDCnZRgt2UCGdjPM24bzyk66b786\n6g0Aq5C4EwZ+q+0augbbxT8GwybHvzxsum8VP208SzYOcH8qvEu553gCLL44jCZS\n6lSSDy2sx6JX7mtpbUucrS0=\n-----END PRIVATE KEY-----\n",
  "client_email": "api-for-owlmarket-item-stock@owlmarket-1d13c.iam.gserviceaccount.com",
  "client_id": "113471179809839114851",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/api-for-owlmarket-item-stock%40owlmarket-1d13c.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

bool isDebug() {
  if (kDebugMode || kProfileMode) {
    return true;
  } else {
    return false;
  }
}

Future processCsv() async {
  final result = await rootBundle.loadString('assets/csv/category.csv');
  List<List<dynamic>> data =
      const CsvToListConverter().convert(result, eol: "\n");

  for (int i = 1; i < data.length; ++i) {
    final c = data[i];
    // vendorCategories[c[0]] = VendorCategory(
    //   id: c[0],
    //   vendorName: c[1].toString().trim(),
    //   categoryName: c[2].toString().trim(),
    // );
  }
}

const List<String> ordersHeaders = [
  '訂單編號',
  '訂單時間',
  '供應商ID',
  '供應商名稱',
  '消費者名稱',
  '商品描述',
  '單品數量',
  '單價',
  '小計',
  '訂單運費',
  '訂單運費折扣',
  '訂單折扣',
  '訂單發票金額',
  '付款日',
  '付款ID',
  '付款方式',
  '訂單來源',
  '裝置類別',
  '作業系統',
  '瀏覽器',
  '商品類別',
];

const List<String> displayHeaders = [
  '訂單編號',
  // '訂單時間',
  // '供應商ID',
  '供應商名稱',
  // '消費者名稱',
  '商品描述',
  '單品數量',
  // '單價',
  // '小計',
  // '訂單運費',
  // '訂單運費折扣',
  // '訂單折扣',
  '訂單發票金額',
  // '付款日',
  '付款ID',
  '付款方式',
  '訂單來源',
  '裝置類別',
  '作業系統',
  '瀏覽器',
  '商品類別',
];

const List<String> salesFiguresHeaders = [
  '供應商名稱',
  '銷售額',
];

const List<String> categoryStatisticsHeaders = [
  '商品類別',
  '發票金額',
];
