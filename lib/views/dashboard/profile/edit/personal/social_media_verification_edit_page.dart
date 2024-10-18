import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialMediaVerificationEditPage extends StatefulWidget {
  const SocialMediaVerificationEditPage({super.key});

  @override
  State<SocialMediaVerificationEditPage> createState() =>
      _SocialMediaVerificationEditPageState();
}

class _SocialMediaVerificationEditPageState
    extends State<SocialMediaVerificationEditPage> {
  bool? criminalRecord;
  bool? nonVegetarian;
  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Verify (Facebook/LinkedIn)',
      onTap: () {},
      children: [
        Text(
          'Verify your account using Facebook and LinkedIn',
          style: TextStyle(color: AppColor.whiteText),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Bootstrap.facebook,
            color: AppColor.blue,
          ),
        ),
        Text(
          'Facebook',
          style: TextStyle(color: AppColor.whiteText),
        ),
        const Gap(15),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Bootstrap.linkedin,
            color: AppColor.blue,
          ),
        ),
        Text(
          'LinkedIn',
          style: TextStyle(color: AppColor.whiteText),
        ),
        const Gap(20),
        Text(
          'Your Trust Score will increase ONLY IF you have more than 50 friends on Facebook or more than 50 connections on LinkedIn',
          style: TextStyle(color: AppColor.whiteText),
        ),
      ],
    );
  }
}
