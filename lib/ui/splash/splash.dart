import 'package:simple/routes.dart';
import 'package:flutter/material.dart';
import 'package:simple/ui/widgets/splash_screen_image_widget/splash_screen_image_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SplashScreenImageWidget(
            image: 'assets/images/launcher/splash.png'));
  }

  navigate() async {
    Navigator.of(context).pushReplacementNamed(Routes.login);
  }
}
