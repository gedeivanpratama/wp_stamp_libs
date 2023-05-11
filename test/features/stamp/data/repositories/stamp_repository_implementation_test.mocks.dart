// Mocks generated by Mockito 5.0.15 from annotations
// in appkey_wp_stamp_module/test/features/stamp/data/repositories/stamp_repository_implementation_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:appkey_wp_stamp_module/features/stamp/data/datasources/stamp_data_source.dart'
    as _i3;
import 'package:appkey_wp_stamp_module/features/stamp/data/models/stamp_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeStampModel_0 extends _i1.Fake implements _i2.StampModel {}

/// A class which mocks [StampDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockStampDataSource extends _i1.Mock implements _i3.StampDataSource {
  MockStampDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.StampModel> getStamp(int? id) =>
      (super.noSuchMethod(Invocation.method(#getStamp, [id]),
              returnValue: Future<_i2.StampModel>.value(_FakeStampModel_0()))
          as _i4.Future<_i2.StampModel>);
  @override
  String toString() => super.toString();
}
