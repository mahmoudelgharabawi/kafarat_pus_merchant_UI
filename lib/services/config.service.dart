import 'dart:convert';

import 'package:tecfy_basic_package/tecfy_basic_package.dart';

class AppConfigService {
  static String get language => ConfigService.getValueString('language');
  static set language(v) => ConfigService.setValueString('language', v);
  static bool get isArabic {
    if (language == 'ar') {
      return true;
    } else {
      return false;
    }
  }
}
