import 'package:equatable/equatable.dart';

class Stamps extends Equatable {
  final int? maxStamp;
  final int? stampCount;
  final String? stampDescription;
  final Stamp? stamp;

  Stamps({this.maxStamp, this.stampCount, this.stampDescription, this.stamp});

  @override
  List<Object?> get props => [maxStamp, stampCount, stampDescription, stamp];

  @override
  bool? get stringify => true;
}

class Stamp extends Equatable {
  final int? id;
  final String? icon;

  Stamp({this.id, this.icon});

  @override
  List<Object?> get props => [id, icon];

  @override
  bool? get stringify => true;
}
