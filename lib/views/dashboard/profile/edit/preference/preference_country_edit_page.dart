import 'package:flutter/material.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class PreferenceCountryEditPage extends StatefulWidget {
  const PreferenceCountryEditPage({super.key});

  @override
  State<PreferenceCountryEditPage> createState() =>
      _PreferenceCountryEditPageState();
}

class _PreferenceCountryEditPageState extends State<PreferenceCountryEditPage> {
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Preference',
      onTap: () {},
      children: [
        Text(
          'Country of residency',
          style:
              TextStyle(color: AppColor.whiteText, fontWeight: FontWeight.w600),
        ),
        const CustomDropDownButton(items: ['Country of residence', '']),
        const CustomDropDownButton(items: ['State of residence', '']),
        const CustomDropDownButton(items: ['City of residence', '']),
        const CustomDropDownButton(items: ['Residency status', '']),
        const CustomDropDownButton(items: ['Country of citizenship', '']),
      ],
    );
  }
}
