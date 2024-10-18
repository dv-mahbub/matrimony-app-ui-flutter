import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function() onTap;
  final double? height;
  final Color? backgroundColor;
  final double? width;
  const CustomButton(
      {super.key,
      this.text,
      required this.onTap,
      this.icon,
      this.width,
      this.height,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 42,
        width: width ?? 320.w,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.primary,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  color: Colors.white,
                )
              : Text(
                  text ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                  maxLines: 1,
                  softWrap: true,
                ),
        ),
      ),
    );
  }
}
