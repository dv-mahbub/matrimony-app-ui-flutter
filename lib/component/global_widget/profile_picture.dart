import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';

class ProfilePicture extends StatelessWidget {
  final double radius;
  final String? image;
  final File? fileImage;
  final String? networkImage;
  final bool? zoomable;
  const ProfilePicture(
      {super.key,
      required this.radius,
      this.image,
      this.fileImage,
      this.networkImage,
      this.zoomable = true});

  @override
  Widget build(BuildContext context) {
    try {
      return zoomable!
          ? InkWell(
              onTap: () {
                if (zoomable!) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.black.withOpacity(0),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          content: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.5),
                                border: Border.all(
                                    width: 3,
                                    color: const Color.fromARGB(
                                        46, 240, 253, 190))),
                            child: ProfilePicture(
                              zoomable: false,
                              radius: 150.sp,
                              image: image,
                              fileImage: fileImage,
                              networkImage: networkImage,
                            ),
                          ),
                        );
                      });
                }
              },
              child: CircleAvatar(
                radius: !zoomable! ? radius : radius + 2.5,
                backgroundColor: AppColor.primary,
                child: CircleAvatar(
                  radius: radius,
                  backgroundImage: image != null
                      ? AssetImage(image!)
                      : fileImage != null
                          ? FileImage(fileImage!)
                          : networkImage != null
                              ? networkImageProvier()
                              : AssetImage(AppImages.demoProfilePicture),
                ),
              ),
            )
          : CircleAvatar(
              radius: !zoomable! ? radius : radius + 2.5,
              backgroundColor: AppColor.primary,
              child: CircleAvatar(
                radius: radius,
                backgroundImage: image != null
                    ? AssetImage(image!)
                    : fileImage != null
                        ? FileImage(fileImage!)
                        : networkImage != null
                            ? networkImageProvier()
                            : AssetImage(AppImages.demoProfilePicture),
              ),
            );
    } catch (e) {
      return CircleAvatar(
        radius: radius + 2.5,
        backgroundColor: AppColor.primary,
        child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(AppImages.demoProfilePicture)),
      );
    }
  }

  dynamic networkImageProvier() {
    try {
      return const NetworkImage('');
    } catch (e) {
      return AssetImage(AppImages.demoProfilePicture);
    }
  }
}
