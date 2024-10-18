import 'package:flutter/material.dart';
import 'package:hello_bou/component/constant/colors.dart';

class CustomRadio extends StatefulWidget {
  final String value;
  final String selectedValue;
  final Function(String selectedValue) onClick;
  const CustomRadio(
      {super.key,
      required this.value,
      required this.onClick,
      required this.selectedValue});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    selectedValue = widget.selectedValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = widget.value;
          widget.onClick(selectedValue);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.primary,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              color: selectedValue == widget.value ? Colors.blue : Colors.white,
              shape: BoxShape.circle,
            ),
            child: selectedValue == widget.value
                ? const Icon(
                    Icons.circle,
                    size: 0.0,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
