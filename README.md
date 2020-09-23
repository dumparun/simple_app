# Simple

 Mobile Application

# Application Icon

Creation of icon

<code>

-   PNG bitmap,
-   image size up to 1024x1024 pixels (Apple App Store icon size requirement),
-   sRGB color profile,
-   max. 1024KB,
-   without interlacing,
-   select the smoothing, resampling, according to the input data or the image content,
-   PPI is not defined, but should not be less than 72, personally I leave the choice at 120–144 (as “future proof”),
-   24-bit color depth (we don’t need 32, because Apple wants assets without an alpha channel (an additional 8bit), i.e. no transparency).

in pubspec.yaml

dev_dependencies:
flutter_launcher_icons:

flutter_icons:
ios: true
android: true
image_path_ios: "assets/launcher/icon.png"
image_path_android: "assets/launcher/icon.png"
adaptive_icon_background: "assets/launcher/background.png"
adaptive_icon_foreground: "assets/launcher/foreground.png"

flutter packages pub run flutter_launcher_icons:main

</code>

# Splash Screen

Creation of image

<code>

-   PNG bitmap,
-   about 200x200 pixels in size,
-   in the sRGB color profile,
-   without interlacing,
-   select anti-aliasing, scaling according to the input data or image content,
-   Leave the PPI equal to 72, the image will be rescaled, based on the PPI (DPI in the case of Android) of device.
-   There is full support for 32-bit color depth (i.e. with transparency).

in pubspec.yaml

dev_dependencies:
flutter_native_splash:

Create a flutter_native_splash.yaml file next to pubspec.yaml, i.e. in the root directory and paste the following code into it:

flutter_native_splash:
image: assets/images/launcher/splash.png
color: '#ffffff'

flutter pub pub run flutter_native_splash:create

</code>

# MobxCode Gen

<code>

        flutter packages pub run build_runner watch
        flutter packages pub run build_runner build --delete-conflicting-outputs

</code>

# Upgrade Flutter

<code>
    To upgrade flutter, dart

    flutter channel stable
    flutter upgrade
    flutter clean
    flutter pub upgrade
    flutter pub cache repair

</code>

In info plist
<key>io.flutter.embedded_views_preview</key>
<string>YES</string>

## IOS Issue

open workspace, make target 12
cd ios
pod update
