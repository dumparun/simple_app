import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inject/inject.dart';
import 'package:simple/constants/strings.dart';
import 'package:simple/modules/preference_module.dart';
import 'package:simple/routes.dart';
import 'package:simple/constants/app_theme.dart';
import 'package:simple/components/app_component.dart';
import 'package:simple/modules/local_module.dart';
import 'package:simple/modules/netwok_module.dart';
import 'package:simple/modules/app_localizations.dart';
import 'package:simple/ui/user/login.dart';

// global instance for app component
var appComponent;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    appComponent = await AppComponent.create(
        NetworkModule(), LocalModule(), PreferenceModule());

    WidgetsFlutterBinding.ensureInitialized();
    runApp(appComponent.app);
  });
}

@provide
class SimpleApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      routes: Routes.routes,
      home: LoginScreen(),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
