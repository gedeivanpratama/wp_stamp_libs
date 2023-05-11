import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../core/internationalize/loc_delegate.dart';
import '../../../../core/static/const.dart';
import '../../../../generated/locale_base.dart';
import '../../data/models/stamp_model.dart';
import '../providers/stamp_provider.dart';
import '../widgets/components.dart' as com;
import '../widgets/stamp_card.dart';
import '../widgets/stamp_information.dart';
import 'qr_scanner.dart';

class StampList extends StatefulWidget {
  const StampList({Key? key}) : super(key: key);

  @override
  _StampListState createState() => _StampListState();
}

class _StampListState extends State<StampList> {
  @override
  void initState() {
    super.initState();
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
      child: ChangeNotifierProvider(
        create: (_) => StampProvider(),
        builder: (ctx, child) {
          final provider = Provider.of<StampProvider>(ctx, listen: false);
          final loc = Localizations.of<LocaleBase>(ctx, LocaleBase)!;
          return Scaffold(
            appBar: AppBar(
              title: Text(loc.main.stamp),
              centerTitle: true,
              leading: com.BackButton(),
              backgroundColor: lStyleParams?.primaryColor,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ListenableProvider<StampProvider>.value(
                          value: provider,
                          child: QrScanner(),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.qr_code_scanner_rounded),
                )
              ],
            ),
            body: Consumer<StampProvider>(
              builder: (context, value, child) {
                final stamp = value.getStamps();
                if (stamp != null) {
                  final data = stamp as StampModel;
                  final icon = data.stamp?.icon ?? "";
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(padding: const EdgeInsets.all(SIZE_MEDIUM), child: StampInformation()),
                          SizedBox(
                            height: 350,
                            child: GridView.count(
                              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              crossAxisCount: 4,
                              childAspectRatio: 1 / 1,
                              children: List.generate(
                                data.maxStamp ?? 0,
                                (index) => StampCard(
                                  icon: icon,
                                  showIcon: (index < (data.stampCount ?? 0)),
                                ),
                              ),
                            ),
                          ),
                          StampDescription(description: data.stampDescription ?? ""),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
