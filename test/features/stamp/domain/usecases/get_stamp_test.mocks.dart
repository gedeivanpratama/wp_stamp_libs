// Mocks generated by Mockito 5.0.15 from annotations
// in appkey_wp_stamp_module/test/features/stamp/domain/usecases/get_stamp_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:appkey_wp_stamp_module/core/error/failures.dart' as _i5;
import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart'
    as _i6;
import 'package:appkey_wp_stamp_module/features/stamp/domain/repositories/stamp_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [StampRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockStampRepository extends _i1.Mock implements _i3.StampRepository {
  MockStampRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Stamps>> getStamps(int? id) =>
      (super.noSuchMethod(Invocation.method(#getStamps, [id]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Stamps>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Stamps>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Stamps>>);
  @override
  String toString() => super.toString();
}
