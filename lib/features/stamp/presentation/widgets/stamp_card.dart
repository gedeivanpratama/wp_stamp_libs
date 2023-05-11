import 'package:appkey_wp_stamp_module/core/static/const.dart';
import 'package:appkey_wp_stamp_module/features/stamp/presentation/pages/stamp_zoom.dart';
import 'package:appkey_wp_stamp_module/features/stamp/presentation/widgets/components.dart';
import 'package:appkey_wp_stamp_module/generated/locale_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class StampCard extends StatelessWidget {
  final String icon;
  final bool showIcon;

  const StampCard({Key? key, required this.icon, this.showIcon = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SIZE_SMALL),
      decoration: BoxDecoration(
        color: STAMP_BG_COLOR,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onLongPress: showIcon
              ? () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => StampZoom(icon: icon)),
                  // );
                  showDialog(
                    context: context,
                    builder: (_) => StampZoom(icon: icon),
                  );
                }
              : null,
          borderRadius: BorderRadius.circular(10),
          child: ClipRect(
            child: showIcon
                ? icon.isNotEmpty
                    ? Image.network(
                        icon,
                        fit: BoxFit.cover,
                        errorBuilder: (context, err, trace) => DefaultImage(),
                      )
                    : DefaultImage()
                : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class StampDescription extends StatelessWidget {
  final String description;

  const StampDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    return Container(
      margin: const EdgeInsets.only(top: SIZE_MEDIUM),
      decoration: BoxDecoration(
        color: STAMP_BG_COLOR,
      ),
      child: Container(
        margin: const EdgeInsets.all(SIZE_MEDIUM),
        padding: const EdgeInsets.all(SIZE_MEDIUM),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.main.description,
              style: TextStyle(
                fontSize: FONT_LARGE,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Html(data: description),
          ],
        ),
      ),
    );
  }
}
