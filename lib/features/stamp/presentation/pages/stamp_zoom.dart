import 'package:appkey_wp_stamp_module/core/static/const.dart';
import 'package:appkey_wp_stamp_module/features/stamp/presentation/widgets/components.dart';
import 'package:flutter/material.dart';

class StampZoom extends StatelessWidget {
  final String icon;
  const StampZoom({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: const EdgeInsets.all(SIZE_MEDIUM),
          padding: const EdgeInsets.all(SIZE_SMALL),
          decoration: BoxDecoration(
            color: STAMP_BG_COLOR,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRect(
              child: icon.isNotEmpty
                  ? Image.network(
                      icon,
                      fit: BoxFit.cover,
                      errorBuilder: (context, err, trace) => DefaultImage(),
                    )
                  : DefaultImage()),
        ),
      ),
    );
  }
}
