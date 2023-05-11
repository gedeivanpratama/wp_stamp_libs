import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../static/const.dart';

class StyleParams extends Equatable {
  final Color primaryColor;
  final Color accentColor;
  final Color stampBgColor;

  StyleParams({
    this.primaryColor = PRIMARY_COLOR,
    this.accentColor = ACCENT_COLOR,
    this.stampBgColor = STAMP_BG_COLOR,
  });

  @override
  List<Object?> get props => [
        primaryColor,
        accentColor,
        stampBgColor,
      ];
}
