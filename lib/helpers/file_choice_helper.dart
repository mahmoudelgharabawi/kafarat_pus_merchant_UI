import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafarat_plus_merchant/services/app_local.service.dart';
import 'package:kafarat_plus_merchant/services/image_service.dart';
import 'package:kafarat_plus_merchant/utils/loading_over_utils.dart';

class FileChoiceHelper {
  static Future showChoiceDialog(
      BuildContext context, void Function(String) onChange,
      {required String nameField,
      required String pathField,
      required String userType}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppLocale.translate(context, "Options"),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: HexColor('#404DC9')),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: HexColor('#404DC9'),
                  ),
                  ListTile(
                    onTap: () async {
                      await _openGallery(context, onChange,
                          nameField: nameField,
                          pathField: pathField,
                          userType: userType);
                    },
                    title: Text(
                      AppLocale.translate(context, "Gallery"),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: HexColor('#404DC9')),
                    ),
                    leading: Icon(
                      Icons.account_box,
                      color: HexColor('#404DC9'),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: HexColor('#404DC9'),
                  ),
                  ListTile(
                    onTap: () async {
                      await _openCamera(context, onChange,
                          nameField: nameField,
                          pathField: pathField,
                          userType: userType);
                    },
                    title: Text(
                      AppLocale.translate(context, "Camera"),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: HexColor('#404DC9')),
                    ),
                    leading: Icon(
                      Icons.camera,
                      color: HexColor('#404DC9'),
                    ),
                  ),
                  // Divider(
                  //   height: 1,
                  //   color: HexColor('#404DC9'),
                  // ),
                  // ListTile(
                  //   onTap: () async {
                  //     await _getFile(context, onChange,
                  //         nameField: nameField,
                  //         pathField: pathField,
                  //         userType: userType);
                  //   },
                  //   title: Text(
                  //     AppLocale.translate(context, "Files"),
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 18,
                  //         color: HexColor('#404DC9')),
                  //   ),
                  //   leading: Icon(
                  //     Icons.file_present,
                  //     color: HexColor('#404DC9'),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
  }

  static Future _getFile(BuildContext context, void Function(String) onChange,
      {required String nameField,
      required String pathField,
      required String userType}) async {
    final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx', 'xlsx', 'png', 'jpeg'],
        withData: true);
    var x = pickedFile?.files[0];

    if (pickedFile?.files[0] != null) {
      await LoadingOverlay.of(context)
          .during(
              ImageService.httpPostFile(x!.bytes!,
                  fileName: x.name,
                  nameField: nameField,
                  pathField: pathField,
                  userType: userType),
              toListen: true)
          .then((value) {
        Navigator.pop(context);
        onChange(value ?? 'No url');
      });
    }
  }

  static Future _openGallery(
      BuildContext context, void Function(String) onChange,
      {required String nameField,
      required String pathField,
      required String userType}) async {
    final pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);
    var x = pickedFile?.files[0];

    if (pickedFile?.files[0] != null) {
      await LoadingOverlay.of(context)
          .during(
              ImageService.httpPostFile(x!.bytes!,
                  fileName: x.name,
                  nameField: nameField,
                  pathField: pathField,
                  userType: userType),
              toListen: true)
          .then((value) {
        Navigator.pop(context);
        onChange(value ?? 'No url');
      });
    }
  }

  static Future _openCamera(
      BuildContext context, void Function(String) onChange,
      {required String nameField,
      required String pathField,
      required String userType}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      var pickedFileList = await pickedFile.readAsBytes();

      await LoadingOverlay.of(context)
          .during(
              ImageService.httpPostFile(pickedFileList,
                  fileName: pickedFile.name,
                  nameField: nameField,
                  pathField: pathField,
                  userType: userType),
              toListen: true)
          .then((value) {
        Navigator.pop(context);
        onChange(value ?? 'No url');
      });
    }
  }
}
