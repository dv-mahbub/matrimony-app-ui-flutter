import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> items;
  final double? width;
  final bool? isBorderRequired;
  const CustomDropDownButton(
      {super.key,
      required this.items,
      this.width,
      this.isBorderRequired = false});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? dropdownValue;
  // Initial Selected Value

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    items.addAll(widget.items);
    if (items.last == '') {
      items.removeLast();
    }
    items.addAll([
      'Option 1',
      'Option 2',
      'Option 3',
      'Option 4',
      'Option 5',
    ]);
    dropdownValue ??= items[0];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: widget.width ?? 310.w,
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            decoration: BoxDecoration(
              color: AppColor.whiteBg,
              border: widget.isBorderRequired!
                  ? Border.all(
                      color: AppColor.primary.withOpacity(.4), width: 1)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              dropdownColor: AppColor.lightPrimary,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
              ),
              iconSize: 24,
              elevation: 16,
              // style: TextStyle(color: AppColor.whiteText),
              underline: Container(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
