import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/internationalize/loc_delegate.dart';
import '../../../../core/static/const.dart';
import '../../../../generated/locale_base.dart';
import '../providers/stamp_provider.dart';
import '../widgets/components.dart' as com;

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Localizations(
      delegates: [
        const LocDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: LocDelegate().isSupported(lLocale!) ? lLocale! : Locale('en', 'US'),
      child: LayoutBuilder(
        builder: (ctx, _) {
          final provider = Provider.of<StampProvider>(ctx, listen: true);
          final loc = Localizations.of<LocaleBase>(ctx, LocaleBase)!;
          void _onQRViewCreated(QRViewController controller) {
            this.controller = controller;
            controller.scannedDataStream.listen(
              (scanData) async {
                if (scanData.code != null) {
                  controller.pauseCamera();
                  await provider.doQRScan(scanData.code!).then(
                    (val) {
                      print(val);
                      if (!val) {
                        Fluttertoast.showToast(msg: loc.response.stamp_add_failed);
                        Navigator.pop(ctx);
                        // controller.resumeCamera();
                      } else {
                        Fluttertoast.showToast(msg: loc.response.stamp_added);
                        provider.getStampsFromAPI(lUserId!).whenComplete(() => Navigator.pop(ctx));
                      }
                    },
                  );
                }
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(loc.main.qr_scanner),
              centerTitle: true,
              leading: com.BackButton(),
              backgroundColor: lStyleParams?.primaryColor,
            ),
            body: Stack(
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: QRView(
                        key: qrKey,
                        onQRViewCreated: _onQRViewCreated,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: provider.isLoading,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
