import 'package:appkey_wp_stamp_module/core/static/const.dart';
import 'package:appkey_wp_stamp_module/generated/locale_base.dart';
import 'package:flutter/material.dart';

class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocDelegate();
  final idMap = const {'en': 'locales/EN_US.json', 'ja': 'locales/JA_JP.json'};

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    bool _isSupported = isSupported(lLocale!);
    var lang = 'en';
    if (_isSupported) lang = lLocale!.languageCode;

    final loc = LocaleBase();
    await loc.load('packages/appkey_wp_stamp_module/${idMap[lang]!}');
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => false;
}
