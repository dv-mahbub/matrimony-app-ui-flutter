import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_bou/component/global_widget/image_pick_alert_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> imagePickerFunction(BuildContext context) async {
  File? pickedImage;
  getPermission();
  try {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImagePickAlertDialog(
          onImagePicked: (image) {
            pickedImage = image;
          },
        );
      },
    );
  } catch (e) {
    log('Image picker - $e');
  }

  // You can now use the pickedImage wherever needed.
  return pickedImage;
}

Future<void> getPermission() async {
  await Permission.camera.request();
  try {
    await Permission.storage.request();
  } catch (e) {
    log("$e");
  }
  try {
    await Permission.photos.request();
  } catch (e) {
    log("$e");
  }
}
