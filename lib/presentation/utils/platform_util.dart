import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformUtil {
  static String determinePlatform() {
    if (kIsWeb) {
      return 'Web';
    }

    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isMacOS) {
      return 'MacOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else {
      return 'Unknown Platform';
    }
  }
}
