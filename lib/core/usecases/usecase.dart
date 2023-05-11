import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/stamp/domain/entities/stamps.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Stamps>> call(Params params);
}

class Params extends Equatable {
  final int? id;

  Params({this.id});

  @override
  List<Object?> get props => [id];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
