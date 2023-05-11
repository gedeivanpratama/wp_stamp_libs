import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  late Map<String, dynamic> _data;
  late String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  late Localemain _main;
  Localemain get main => _main;
  late Localeresponse _response;
  Localeresponse get response => _response;

  void initAll() {
    _main = Localemain(Map<String, String>.from(_data['main']));
    _response = Localeresponse(Map<String, String>.from(_data['response']));
  }
}

class Localemain {
  late final Map<String, String> _data;
  Localemain(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get stamp => _data["stamp"]!;
  String get stamp_card => _data["stamp_card"]!;
  String get pcs => _data["pcs"]!;
  String get qr_scanner => _data["qr_scanner"]!;
  String get description => _data["description"]!;
}

class Localeresponse {
  late final Map<String, String> _data;
  Localeresponse(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get stamp_added => _data["stamp_added"]!;
  String get stamp_add_failed => _data["stamp_add_failed"]!;
}

