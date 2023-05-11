import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/static/const.dart';
import '../models/stamp_model.dart';

abstract class StampDataSource {
  Future<StampModel> getStamp(int? id);
  Future<bool> qrScan(String url);
}

class StampDataSourceImplementation implements StampDataSource {
  final Dio dio;

  StampDataSourceImplementation({required this.dio});

  @override
  Future<StampModel> getStamp(int? id) async {
    // final _url = "https://example.com";
    final _url = lBaseUrl + "stamp/get-by-user-id?user_id=" + id.toString();
    final response = await dio.get(_url);
    // print('response: ' + response.data.toString());
    // print('statusCode:' + response.statusCode.toString());
    if (response.statusCode == 200) {
      // print("return: " + StampModel.fromJson(response.data).toString());
      return StampModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<bool> qrScan(String url) async {
    print('qr scan url: $url');
    final formData = FormData.fromMap({'user_id': lUserId});
    try {
      final response = await dio.post(url, data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
