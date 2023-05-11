import 'package:appkey_wp_stamp_module/core/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/locale_base.dart';
import '../providers/stamp_provider.dart';

class StampInformation extends StatelessWidget {
  const StampInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    return Container(
      color: Colors.white,
      child: Center(
        child: Consumer<StampProvider>(builder: (ctx, provider, _) {
          final _stamps = provider.getStamps();
          final _total = _stamps?.stampCount ?? 0;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                loc.main.stamp_card,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[400],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_total.toString()} ',
                    style: TextStyle(
                      fontSize: FONT_LARGE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${loc.main.pcs}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: FONT_EXTRA_SMALL,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
