import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/background.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';

class EditPageTemplate extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final Function() onTap;
  const EditPageTemplate(
      {super.key,
      required this.title,
      required this.children,
      required this.onTap});

  @override
  State<EditPageTemplate> createState() => _EditPageTemplateState();
}

class _EditPageTemplateState extends State<EditPageTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
                child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColor.whiteText,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.whiteText),
                ),
              ],
            )),
            const Gap(10),
            GlassContainer(
              width: 330.w,
              blur: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [const Gap(10), ...widget.children, const Gap(10)],
              ),
            ),
            const Gap(15),
            CustomButton(
              onTap: widget.onTap,
              text: 'Done',
            ),
            const Gap(15),
          ],
        ),
      ),
    );
  }
}
