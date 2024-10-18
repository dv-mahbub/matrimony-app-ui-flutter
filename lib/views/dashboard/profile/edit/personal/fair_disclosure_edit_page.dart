import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class FairDisclosureEditPage extends StatefulWidget {
  const FairDisclosureEditPage({super.key});

  @override
  State<FairDisclosureEditPage> createState() => _FairDisclosureEditPageState();
}

class _FairDisclosureEditPageState extends State<FairDisclosureEditPage> {
  bool? criminalRecord;
  bool? nonVegetarian;
  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Fair Disclosure',
      onTap: () {},
      children: [
        SizedBox(
          width: 310.w,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'I have a criminal record/Background in India or outside India',
                  style: TextStyle(color: AppColor.whiteText),
                ),
              ),
              customToggleButton(criminalRecord, (newValue) {
                if (mounted) {
                  setState(() {
                    criminalRecord = newValue;
                  });
                }
              }),
            ],
          ),
        ),
        const CustomDropDownButton(items: ['Special Cases', '']),
        const CustomDropDownButton(items: ['I am a smoker', '']),
        const CustomDropDownButton(items: ['I drink alcohol', '']),
        SizedBox(
          width: 310.w,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'I am non-vegetarian ',
                  style: TextStyle(color: AppColor.whiteText),
                ),
              ),
              customToggleButton(nonVegetarian, (newValue) {
                if (mounted) {
                  setState(() {
                    nonVegetarian = newValue;
                  });
                }
              }),
            ],
          ),
        ),
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
}
