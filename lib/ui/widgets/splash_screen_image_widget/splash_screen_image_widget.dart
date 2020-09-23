import 'package:flutter/material.dart';

class SplashScreenImageWidget extends StatelessWidget {
  final image;

  const SplashScreenImageWidget({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, fit: BoxFit.cover);
  }
}
