import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';

customAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: .8.sw,
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(.5),
              borderRadius: BorderRadius.circular(27)),
          child: Column(
            children: [
              const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    width: .33.sw,
                    text: 'Ok',
                  ),
                  const Gap(5),
                  CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    width: .33.sw,
                    text: 'Cancel',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
