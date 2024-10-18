import 'package:flutter/material.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class PreferenceLifestyleEditPage extends StatefulWidget {
  const PreferenceLifestyleEditPage({super.key});

  @override
  State<PreferenceLifestyleEditPage> createState() =>
      _PreferenceLifestyleEditPageState();
}

class _PreferenceLifestyleEditPageState
    extends State<PreferenceLifestyleEditPage> {
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Preference',
      onTap: () {},
      children: [
        Text(
          'Lifestyle & hobbies',
          style:
              TextStyle(color: AppColor.whiteText, fontWeight: FontWeight.w600),
        ),
        const CustomDropDownButton(items: ['Diet', '']),
        const CustomDropDownButton(items: ['Smoke', '']),
        const CustomDropDownButton(items: ['Drink', '']),
        const CustomDropDownButton(items: ['Hobbies', '']),
      ],
    );
  }
}
