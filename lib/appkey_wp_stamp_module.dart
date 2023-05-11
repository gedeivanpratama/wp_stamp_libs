library appkey_wp_stamp_module;

import 'package:appkey_wp_stamp_module/core/static/const.dart';
import 'package:appkey_wp_stamp_module/core/utility/styles.dart';
import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart';
import 'package:appkey_wp_stamp_module/features/stamp/presentation/pages/stamp_list.dart';
import 'package:appkey_wp_stamp_module/features/stamp/presentation/providers/stamp_provider.dart';
import 'package:flutter/material.dart';

class StampModule {
  late StampProvider _stampProvider;

  StampModule initialize({
    required String baseUrl,
    required StyleParams? styleParams,
    required int userId,
    required Locale locale,
  }) {
    lBaseUrl = baseUrl;
    lStyleParams = styleParams;
    lUserId = userId;
    lLocale = locale;
    return StampModule();
  }

  // Screen / Widgets
  final stampListWidget = new StampList();

  // Method Only
  Future<Stamps?> getStampData() async {
    _stampProvider = StampProvider();
    return _stampProvider.getStampsFromAPI(lUserId!);
  }
}
