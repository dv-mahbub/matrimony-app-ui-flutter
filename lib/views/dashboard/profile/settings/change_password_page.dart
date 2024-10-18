import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/background.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/component/global_widget/title_text.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Column(
          children: [
            const Gap(30),
            const TitleText(text: 'Change Password'),
            const Gap(30),
            CustomField(
              hintText: 'Old Password',
              controller: oldPasswordController,
              secured: true,
            ),
            CustomField(
              hintText: 'New Password',
              controller: newPasswordController,
              secured: true,
            ),
            CustomField(
              hintText: 'Confirm New Password',
              controller: confirmPasswordController,
              secured: true,
            ),
            const Gap(30),
            CustomButton(
              onTap: () {},
              text: 'Save',
            ),
            const Gap(10),
            CustomButton(
              onTap: () {},
              text: 'Cancel',
              backgroundColor: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}
