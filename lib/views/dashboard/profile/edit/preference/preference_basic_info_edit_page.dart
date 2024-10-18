import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class PreferenceBasicInfoEditPage extends StatefulWidget {
  const PreferenceBasicInfoEditPage({super.key});

  @override
  State<PreferenceBasicInfoEditPage> createState() =>
      _PreferenceBasicInfoEditPageState();
}

class _PreferenceBasicInfoEditPageState
    extends State<PreferenceBasicInfoEditPage> {
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Preference',
      onTap: () {},
      children: [
        Text(
          'Basic information',
          style:
              TextStyle(color: AppColor.whiteText, fontWeight: FontWeight.w600),
        ),
        CustomField(
          hintText: 'Write about your desired partner',
          controller: aboutController,
          maxLine: 3,
          minLine: 3,
        ),
        SizedBox(
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Age:     ',
                style: TextStyle(color: AppColor.whiteText),
              ),
              CustomDropDownButton(
                items: const ['Select', ''],
                width: .3.sw,
              ),
              Text(
                'to',
                style: TextStyle(color: AppColor.whiteText),
              ),
              CustomDropDownButton(
                items: const ['Select', ''],
                width: .3.sw,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Height:',
                style: TextStyle(color: AppColor.whiteText),
              ),
              CustomDropDownButton(
                items: const ['Select', ''],
                width: .3.sw,
              ),
              Text(
                'to',
                style: TextStyle(color: AppColor.whiteText),
              ),
              CustomDropDownButton(
                items: const ['Select', ''],
                width: .3.sw,
              ),
            ],
          ),
        ),
        const CustomDropDownButton(items: ['Marital status', '']),
        const CustomDropDownButton(items: ['Complexion', '']),
        const CustomDropDownButton(items: ['Health', '']),
        const CustomDropDownButton(items: ['Mangolik', '']),
        const CustomDropDownButton(items: ['Special Cases', '']),
      ],
    );
  }
}
