import 'dart:convert';

class AppHelper {
  static const String merchantAuthurl =
      'https://foodexpress-api.tecfy.co/api/merchant/auth/';

  static const String merchantSetupurl =
      'https://foodexpress-api.tecfy.co/api/merchant/setup/';
  static const String merchantOperationurl =
      'https://foodexpress-api.tecfy.co/api/merchant/operation/';
  static const String registerToken =
      'https://foodexpress-api.tecfy.co/api/general/notification-register/';
  static const String generalLookupUrl =
      'https://foodexpress-api.tecfy.co/api/general/lookup/';
  static const String generalStorageUrl =
      'https://foodexpress-api.tecfy.co/api/general/storage/file';

  static Map<String, dynamic>? compareJsons(
      {required Map<String, dynamic> oldJson,
      required Map<String, dynamic> newJson,
      List<String>? keysNotDeleted = const ['_id']}) {
    Map<String, dynamic>? result = {};

    // if (oldJson.keys.toSet().difference(newJson.keys.toSet()).isNotEmpty) {
    //   for (var value in oldJson.keys.toSet().difference(newJson.keys.toSet())) {
    //     result[value] = oldJson[value];
    //   }
    // }

    for (var key in newJson.keys) {
      if (jsonEncode(newJson[key]) != jsonEncode(oldJson[key])) {
        result[key] = newJson[key];
      }
    }

    if (result.isNotEmpty) {
      for (var keyId in keysNotDeleted ?? []) {
        result[keyId] = newJson[keyId];
      }
    }

    return result;
  }
}
