import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/stamps.dart';

abstract class StampRepository {
  Future<Either<Failure, Stamps>> getStamps(int? id);
  Future<bool> qrScan(String url);
}
