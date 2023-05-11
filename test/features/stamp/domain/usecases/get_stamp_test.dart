import 'package:appkey_wp_stamp_module/core/usecases/usecase.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/repositories/stamp_repository.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/usecases/get_stamp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_stamp_test.mocks.dart';

@GenerateMocks([StampRepository])
void main() {
  late GetStamp usecase;
  late MockStampRepository mockStampRepository;

  setUp(() {
    mockStampRepository = MockStampRepository();
    usecase = GetStamp(mockStampRepository);
  });

  final tId = 1;
  final tStamp = Stamp(id: 123, icon: "https://i1.wp.com/kliklegal.com/wp-content/uploads/2018/08/Original-stamp.jpg?fit=1024%2C835&ssl=1");
  final tStamps = Stamps(
    maxStamp: 20,
    stampCount: 5,
    stamp: tStamp,
  );

  test("should return stamps data from repository", () async {
    //arrange
    when(mockStampRepository.getStamps(any)).thenAnswer((_) async => Right(tStamps));

    //act
    final result = await usecase(Params(id: tId));

    //assert
    expect(result, Right(tStamps));
    verify(mockStampRepository.getStamps(tId));
    verifyNoMoreInteractions(mockStampRepository);
  });
}
