import 'package:flutter/material.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_alert_dialog.dart';

class CustomIconButon extends StatelessWidget {
  final Widget icon;
  final Function()? onTap;
  const CustomIconButon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          customAlertDialog(context);
        }
      },
      child: CircleAvatar(
        backgroundColor: AppColor.primary.withOpacity(.4),
        child: icon,
      ),
    );
  }
}
