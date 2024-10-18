import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickAlertDialog extends StatefulWidget {
  final void Function(File pickedImage)? onImagePicked;

  const ImagePickAlertDialog({super.key, this.onImagePicked});

  @override
  State<ImagePickAlertDialog> createState() => _ImagePickAlertDialogState();
}

class _ImagePickAlertDialogState extends State<ImagePickAlertDialog> {
  ImagePicker imagePicker = ImagePicker();
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      actions: [
        SizedBox(
          height: 200,
          width: 270.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Source",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () async {
                  final pickerImageFile = await imagePicker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 80,
                    preferredCameraDevice: CameraDevice.front,
                  );
                  setState(() {
                    if (pickerImageFile != null) {
                      pickedImage = File(pickerImageFile.path);
                      if (mounted) {
                        widget.onImagePicked?.call(pickedImage!);
                        Navigator.pop(context);
                      }
                    }
                  });
                },
                child: const Text(
                  "Camera",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () async {
                  final pickerImageFile = await imagePicker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 80,
                    preferredCameraDevice: CameraDevice.front,
                  );
                  setState(() {
                    if (pickerImageFile != null) {
                      pickedImage = File(pickerImageFile.path);
                      if (mounted) {
                        widget.onImagePicked?.call(pickedImage!);
                        Navigator.pop(context);
                      }
                    }
                  });
                },
                child: const Text('Gallery', style: TextStyle(fontSize: 16)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
