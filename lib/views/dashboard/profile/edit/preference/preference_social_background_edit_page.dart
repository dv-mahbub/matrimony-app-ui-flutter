import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class PreferenceSocialBackgroundEditPage extends StatefulWidget {
  const PreferenceSocialBackgroundEditPage({super.key});

  @override
  State<PreferenceSocialBackgroundEditPage> createState() =>
      _PreferenceSocialBackgroundEditPageState();
}

class _PreferenceSocialBackgroundEditPageState
    extends State<PreferenceSocialBackgroundEditPage> {
  TextEditingController aboutController = TextEditingController();
  bool? casteNo;
  bool? gotra;

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Preference',
      onTap: () {},
      children: [
        Text(
          'Social Background',
          style:
              TextStyle(color: AppColor.whiteText, fontWeight: FontWeight.w600),
        ),
        const CustomDropDownButton(items: ['Religion', '']),
        const CustomDropDownButton(items: ['Mother tongue', '']),
        const CustomDropDownButton(items: ['Caste', '']),
        const CustomDropDownButton(items: ['Sub caste', '']),
        const Gap(4),
        SizedBox(
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Caste no bar',
                style: TextStyle(color: AppColor.whiteText),
              ),
              customToggleButton(casteNo, (newValue) {}),
            ],
          ),
        ),
        const Gap(8),
        SizedBox(
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gotra/Gothram',
                style: TextStyle(color: AppColor.whiteText),
              ),
              customToggleButton2(gotra, (newValue) {}),
            ],
          ),
        )
      ],
    );
  }

  Row customToggleButton(bool? value, Function(bool newValue) onUpdate) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onUpdate(true);
          },
          child: Container(
            width: 60,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
                color: value == true ? AppColor.primary : AppColor.whiteBg),
            child: Text(
              'Yes',
              style: TextStyle(
                  color:
                      value == true ? AppColor.whiteText : AppColor.blackText),
            ),
          ),
        ),
        VerticalDivider(
          color: AppColor.grey,
          width: .5,
        ),
        InkWell(
          onTap: () {
            onUpdate(false);
          },
          child: Container(
            width: 60,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                color: value == false ? AppColor.primary : AppColor.whiteBg),
            child: Text(
              'No',
              style: TextStyle(
                color: value == false ? AppColor.whiteText : AppColor.blackText,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row customToggleButton2(bool? value, Function(bool newValue) onUpdate) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onUpdate(true);
          },
          child: Container(
            width: 60,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
                color: value == true ? AppColor.primary : AppColor.whiteBg),
            child: Text(
              'Gotra',
              style: TextStyle(
                  color:
                      value == true ? AppColor.whiteText : AppColor.blackText),
            ),
          ),
        ),
        VerticalDivider(
          color: AppColor.grey,
          width: .5,
        ),
        InkWell(
          onTap: () {
            onUpdate(false);
          },
          child: Container(
            width: 60,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                color: value == false ? AppColor.primary : AppColor.whiteBg),
            child: Text(
              'Gotram',
              style: TextStyle(
                color: value == false ? AppColor.whiteText : AppColor.blackText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
