import 'package:appkey_wp_stamp_module/features/stamp/data/datasources/stamp_data_source.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart';
import 'package:appkey_wp_stamp_module/core/error/failures.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/repositories/stamp_repository.dart';
import 'package:dartz/dartz.dart';

class StampRepositoryImplementation implements StampRepository {
  final StampDataSource stampDataSource;

  StampRepositoryImplementation({
    required this.stampDataSource,
  });

  @override
  Future<Either<Failure, Stamps>> getStamps(int? id) async {
    try {
      final data = await stampDataSource.getStamp(id);
      return Right(data);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<bool> qrScan(String url) async {
    try {
      final data = await stampDataSource.qrScan(url);
      return data;
    } catch (e) {
      print('qrScan-error: ${e.toString()}');
      return false;
    }
  }
}
