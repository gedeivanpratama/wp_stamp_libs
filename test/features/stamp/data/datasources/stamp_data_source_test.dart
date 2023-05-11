import 'dart:convert';

import 'package:appkey_wp_stamp_module/features/stamp/data/datasources/stamp_data_source.dart';
import 'package:appkey_wp_stamp_module/features/stamp/data/models/stamp_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late StampDataSourceImplementation dataSourceImplementation;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
    dataSourceImplementation = StampDataSourceImplementation(dio: dioAdapter.dio);
  });

  test("get Stamp from raw API (Dio)", () async {
    //arrange
    final Map<String, dynamic> tResponseJson = json.decode(fixture('stamps.json'));
    final tStamps = StampModel.fromJson(tResponseJson);
    const url = "https://example.com";

    dioAdapter.onGet(url, (server) {
      return server.reply(200, fixture('stamps.json'));
    });

    //act
    final response = await dio.get(url);

    //assert
    final result = StampModel.fromJson(json.decode(response.data));
    expect(result, tStamps);
  });

  test("get Stamp from datasourse implementation", () async {
    //arrange
    final Map<String, dynamic> tResponseJson = json.decode(fixture('stamps.json'));
    final tStamps = StampModel.fromJson(tResponseJson);
    const url = "https://example.com";

    dioAdapter.onGet(url, (server) {
      return server.reply(200, fixture('stamps.json'));
    });

    //act
    final result = await dataSourceImplementation.getStamp(99);

    //assert
    expect(result, tStamps);
  });
}
