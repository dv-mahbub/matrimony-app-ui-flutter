import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';

class CustomField extends StatefulWidget {
  final String? label;
  final String hintText;
  final double? width;
  final double? height;
  final void Function()? onSuffixIconTap;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? isSized;
  final TextEditingController controller;
  final bool? secured;
  final TextInputType? keyboardType;
  final String? topLabel;
  final bool? enabled;
  final int? maxLine;
  final int? minLine;
  final FocusNode? focusNode;
  final void Function(String searchItem)? onChange;

  const CustomField({
    this.onChange,
    this.maxLine,
    this.minLine,
    super.key,
    this.label,
    required this.hintText,
    this.onSuffixIconTap,
    this.suffixIcon,
    this.isSized,
    required this.controller,
    this.secured = false,
    this.keyboardType,
    this.topLabel,
    this.enabled,
    this.prefixIcon,
    this.width,
    this.focusNode,
    this.height,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: widget.width ?? 310.w,
      // height: widget.height ?? 42,
      child: Center(
        child: TextFormField(
          textAlign: TextAlign.start,
          onChanged: widget.onChange,
          minLines: widget.minLine ?? 1,
          maxLines: widget.maxLine ?? 1,
          focusNode: widget.focusNode,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          obscureText: widget.secured! && showText,
          controller: widget.controller,
          decoration: InputDecoration(
            // prefixIcon: Icon(widget.prefixIcon),
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            fillColor: Colors.white,
            filled: true,

            // labelText: widget.controller.text.isEmpty ? null : widget.hintText,
            hintText: widget.controller.text.isEmpty ? widget.hintText : null,
            hintStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: AppColor.blackText.withOpacity(.5)),
            suffixIcon: widget.secured!
                ? IconButton(
                    icon: Icon(
                        showText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showText = !showText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
