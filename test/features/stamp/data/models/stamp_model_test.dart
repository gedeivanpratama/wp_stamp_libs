import 'dart:convert';

import 'package:appkey_wp_stamp_module/features/stamp/data/models/stamp_model.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart' as entity;
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tStamp = Stamp(id: 123, icon: "https://asfasdfasdf");
  final tStampModel = StampModel(maxStamp: 20, stampCount: 5, stamp: tStamp);

  test("should be a subclass of Stamps entity", () async {
    //assert
    expect(tStampModel, isA<entity.Stamps>());
  });

  test("return model from json", () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('stamps.json'));

    //act
    final result = StampModel.fromJson(jsonMap);

    //assert
    expect(result, tStampModel);
  });

  test("return json map from model", () async {
    //act
    final result = tStampModel.toJson();

    //assert
    final expectedMap = {
      "max_stamp": 20,
      "stamp_count": 5,
      "stamp": {
        "id": 123,
        "icon": "https://asfasdfasdf",
      }
    };
    expect(result, expectedMap);
  });
}
