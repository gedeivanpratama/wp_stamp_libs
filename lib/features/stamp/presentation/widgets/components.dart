import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_rounded),
      color: Colors.white,
    );
  }
}

class DefaultImage extends StatelessWidget {
  const DefaultImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        'assets/images/placeholder.png',
        package: 'appkey_wp_stamp_module',
      ),
    );
  }
}
