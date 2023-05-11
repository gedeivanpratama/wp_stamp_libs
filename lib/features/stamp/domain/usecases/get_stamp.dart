import 'package:appkey_wp_stamp_module/core/error/failures.dart';
import 'package:appkey_wp_stamp_module/core/usecases/usecase.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/repositories/stamp_repository.dart';
import 'package:dartz/dartz.dart';

class GetStamp implements UseCase<Stamps, Params> {
  final StampRepository repository;

  GetStamp(this.repository);

  @override
  Future<Either<Failure, Stamps>> call(Params params) async {
    return await repository.getStamps(params.id);
  }
}
