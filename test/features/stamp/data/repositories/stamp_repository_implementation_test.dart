import 'dart:convert';

import 'package:appkey_wp_stamp_module/core/error/failures.dart';
import 'package:appkey_wp_stamp_module/features/stamp/data/datasources/stamp_data_source.dart';
import 'package:appkey_wp_stamp_module/features/stamp/data/models/stamp_model.dart';
import 'package:appkey_wp_stamp_module/features/stamp/data/repositories/stamp_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'stamp_repository_implementation_test.mocks.dart';

@GenerateMocks([StampDataSource])
void main() {
  late StampRepositoryImplementation repositoryImplementation;
  late MockStampDataSource mockStampDataSource;

  setUp(() {
    mockStampDataSource = MockStampDataSource();
    repositoryImplementation = StampRepositoryImplementation(
      stampDataSource: mockStampDataSource,
    );
  });

  group("stamp repository impelemtation", () {
    final Map<String, dynamic> jsonMap = json.decode(fixture('stamps.json'));
    final tStampModel = StampModel.fromJson(jsonMap);
    final tID = 99;

    test("return data when success", () async {
      //arrange
      when(mockStampDataSource.getStamp(any)).thenAnswer((_) async => tStampModel);

      //act
      final result = await repositoryImplementation.getStamps(tID);

      //assert
      verify(mockStampDataSource.getStamp(tID));
      expect(result, equals(Right(tStampModel)));
    });

    test("return server failure when request failed", () async {
      //arrange
      when(mockStampDataSource.getStamp(tID)).thenThrow(Exception());

      //act
      final result = await repositoryImplementation.getStamps(tID);

      //assert
      verify(mockStampDataSource.getStamp(tID));
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
