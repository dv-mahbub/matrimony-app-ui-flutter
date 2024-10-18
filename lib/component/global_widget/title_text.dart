import 'package:flutter/material.dart';
import 'package:hello_bou/component/constant/colors.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  const TitleText({super.key, required this.text, this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? AppColor.whiteText,
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 22),
    );
  }
}
