import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class Responsive {
  static const double screenDesktopWidth = 720;
  static const double figmaDesktopScreenWidth = 1280;

  static bool isMobile(BuildContext? context) {
    if (context == null) return false;
    return MediaQuery.sizeOf(context).width < screenDesktopWidth;
  }

  static double screenWidth(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    if (width > figmaDesktopScreenWidth) {
      width = figmaDesktopScreenWidth;
    }

    return width;
  }

  static double ratioWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width / figmaDesktopScreenWidth;

  static get isDevice => (GetPlatform.isAndroid || GetPlatform.isIOS);
  static get isWebDevice => kIsWeb && isDevice;
}
