import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:kafarat_plus_merchant/helpers/app_helper.dart';
import 'package:tecfy_basic_package/tecfy_basic_package.dart';

class ImageService {
  static Future<String?> httpPostFile(
    Uint8List fileData, {
    required String fileName,
    required String nameField,
    required String pathField,
    required String userType,
  }) async {
    String dataString;
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse('${AppHelper.generalStorageUrl}/${userType}'));
      request.headers['Authorization'] = 'Bearer ${ConfigService.token}';
      request.fields['name'] = nameField;
      request.fields['path'] = pathField;
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        fileData,
        filename: fileName,
        contentType: MediaType('application', 'x-tar'),
      ));
      var response = await request.send();
      if (response.statusCode == 200) {
        print("Uploaded!!!");
        var data = (await response.stream.toBytes());
        print(data.length);
        dataString = utf8.decode(data);
        var dataConverted = json.decode(dataString);
        print('Data Uploaded$dataConverted');
        if (dataConverted['data'] != null) {
          return dataConverted['data'];
        }
        return null;
      }
      print('ERROR HTTP POST FILE ${response.statusCode}');
      return null;
    } catch (err, t) {
      print('XXXXXXXXXXXXXXXX post file error: $err , ${t.toString()}');
      return null;
    }
  }
}
