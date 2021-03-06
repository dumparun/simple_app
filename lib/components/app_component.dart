import 'package:simple/modules/local_module.dart';
import 'package:simple/modules/netwok_module.dart';
import 'package:simple/modules/preference_module.dart';
import 'package:simple/main.dart';
import 'package:inject/inject.dart';

import 'app_component.inject.dart' as g;

/// The top level injector that stitches together multiple app features into
/// a complete app.
@Injector(const [NetworkModule, LocalModule, PreferenceModule])
abstract class AppComponent {
  @provide
  SimpleApp get app;

  static Future<AppComponent> create(
    NetworkModule networkModule,
    LocalModule localModule,
    PreferenceModule preferenceModule,
  ) async {
    return await g.AppComponent$Injector.create(
      networkModule,
      localModule,
      preferenceModule,
    );
  }
}
