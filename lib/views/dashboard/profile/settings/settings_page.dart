import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/background.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/component/global_widget/image_picker_function.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/dashboard/profile/settings/add_cover_photo_page.dart';
import 'package:hello_bou/views/dashboard/profile/settings/change_password_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  File? pickedImage;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    emailController.text = 'someone@mail.com';
    phoneController.text = '+9888948900';
    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(30),
                profilePicture(context),
                const Gap(10),
                TextButton(
                    onPressed: () {
                      if (mounted) {
                        navigate(
                            context: context, child: const AddCoverPhotoPage());
                      }
                    },
                    child: Text(
                      'Add cover photos',
                      style: TextStyle(color: AppColor.whiteText),
                    )),
                const Gap(10),
                CustomField(
                    hintText: 'Enter email', controller: emailController),
                CustomField(
                    hintText: 'Enter phone number',
                    controller: phoneController),
                const Gap(15),
                CustomButton(
                  onTap: () {},
                  text: 'Update',
                ),
                const Gap(10),
                TextButton(
                  onPressed: () {
                    if (mounted) {
                      navigate(
                          context: context, child: const ChangePasswordPage());
                    }
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(color: AppColor.whiteText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell profilePicture(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (mounted) {
          pickedImage = await imagePickerFunction(context);
          setState(() {});
        }
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: pickedImage != null
                ? FileImage(pickedImage!)
                : AssetImage(AppImages.demoProfilePicture) as ImageProvider,
          ),
          Positioned(
            bottom: 3,
            right: 0,
            child: Icon(
              Icons.add_a_photo_rounded,
              color: AppColor.primary,
            ),
          )
        ],
      ),
    );
  }
}
