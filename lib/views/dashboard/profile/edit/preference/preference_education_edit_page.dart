import 'package:flutter/material.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class PreferenceEducationEditPage extends StatefulWidget {
  const PreferenceEducationEditPage({super.key});

  @override
  State<PreferenceEducationEditPage> createState() =>
      _PreferenceEducationEditPageState();
}

class _PreferenceEducationEditPageState
    extends State<PreferenceEducationEditPage> {
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Preference',
      onTap: () {},
      children: [
        Text(
          'Education and career',
          style:
              TextStyle(color: AppColor.whiteText, fontWeight: FontWeight.w600),
        ),
        const CustomDropDownButton(items: ['Educational Qualification', '']),
        const CustomDropDownButton(items: ['Employed As', '']),
        const CustomDropDownButton(items: ['Area/Field', '']),
        const CustomDropDownButton(items: ['Employed With', '']),
        const CustomDropDownButton(items: ['Annual Income', '']),
      ],
    );
  }
}
