import 'dart:convert';

import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart' as entity;

class StampModel extends entity.Stamps {
  StampModel({
    required int maxStamp,
    required int stampCount,
    required String stampDescription,
    required Stamp stamp,
  }) : super(maxStamp: maxStamp, stampCount: stampCount, stampDescription: stampDescription, stamp: stamp);

  factory StampModel.fromRawJson(String str) => StampModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StampModel.fromJson(Map<String, dynamic> json) => StampModel(
        maxStamp: (json["max_stamp"] as num).toInt(),
        stampCount: (json["stamp_count"] as num).toInt(),
        stampDescription: json["description"] == null ? null : json["description"],
        stamp: Stamp.fromJson(json["stamp"]),
      );

  Map<String, dynamic> toJson() => {
        "max_stamp": maxStamp,
        "stamp_count": stampCount,
        "description": stampDescription == null ? null : stampDescription,
        "stamp": (stamp as Stamp).toJson(),
      };
}

class Stamp extends entity.Stamp {
  Stamp({
    required int id,
    required String icon,
  }) : super(id: id, icon: icon);

  factory Stamp.fromRawJson(String str) => Stamp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stamp.fromJson(Map<String, dynamic> json) => Stamp(
        id: (json["id"] as num).toInt(),
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
      };
}
