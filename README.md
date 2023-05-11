# appkey_wp_stamp_module

A module for handle coupon feature for Appkey Wordpress App.
[Example App](https://gitlab.com/appkey.jp/appkey-wp-module-example-app)

## Installation

Add package on Pubspec.yaml

```dart
dependencies:
  flutter:
    sdk: flutter
  appkey_wp_stamp_module:
    git:
      url: https://gitlab+deploy-token-607329:JfCA8ePg2m_8NFgx52BC@gitlab.com/appkey.jp/appkey-wp-stamp-module.git
      ref: 0.0.4 #check latest version
```

Import Package

```dart
import 'package:appkey_wp_stamp_module/appkey_wp_stamp_module.dart';
import 'package:appkey_wp_stamp_module/core/utility/styles.dart' as stampStyle;
```

Initialize module

```dart
// late variable
late StampModule stampModule;

// const
const String BASE_URL = "https://appshop.link/API/api/";

// Locale
// Platform.localeName will return "en_US".
// So we need to split and get lang & country code.
final localeString = Platform.localeName.split("_");
Locale deviceLocale = Locale(localeString.first, localeString.last);

// initialize module
stampModule = new StampModule().initialize(
	baseUrl: BASE_URL,
	styleParams: stampStyle.StyleParams(
		primaryColor: Colors.red,
	),
	userId: 3,
  locale: deviceLocale,
);
```

## Usage

Get widget

```dart
Widget stampListWidget() => stampModule.stampListWidget;
```

Implementation example by return **stampListWidget()**
```dart
@override
Widget build(BuildContext context) {
  return stampListWidget();
}
```

Get stamp list data only
```dart
import 'package:appkey_wp_stamp_module/features/stamp/domain/entities/stamps.dart' as entity;

Future<entity.Stamps?> stampData() async {
  return await stampModule.getStampData();
}
```