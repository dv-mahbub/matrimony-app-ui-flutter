import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';

class DatePickerField extends StatefulWidget {
  final String? initialText;
  final int? startingYear;
  final int? startingMonth;
  final int? startingDay;
  final double? height;
  final bool? noFutureDatePick;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final Function(DateTime?) onDatePicked;

  const DatePickerField(
      {super.key,
      required this.onDatePicked,
      this.initialText,
      this.startingYear,
      this.height,
      this.startingMonth,
      this.startingDay,
      this.noFutureDatePick = false,
      this.lastDate,
      this.firstDate});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late String previewDate;
  @override
  void initState() {
    previewDate = widget.initialText ?? 'Pick a date';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 310.w,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Stack(
          children: [
            Container(
              height: widget.height ?? 45,
              width: 310.w,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                color: AppColor.whiteBg,
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  previewDate,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      color: AppColor.blackText,
                      fontWeight: previewDate == widget.initialText ||
                              previewDate == 'Pick a date'
                          ? FontWeight.w300
                          : FontWeight.normal),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: SizedBox(
                // height: double.infinity,
                width: 40.w,
                height: widget.height ?? 35.sp,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColor.blackText.withOpacity(.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTap() async {
    DateTime currentDate = DateTime.now();

    var datePicked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime(
          widget.startingYear ?? currentDate.year,
          widget.startingMonth ?? currentDate.month,
          widget.startingDay ?? currentDate.day),
      firstDate: widget.firstDate ?? DateTime(2020),
      lastDate: widget.noFutureDatePick!
          ? DateTime(currentDate.year, currentDate.month, currentDate.day)
          : widget.lastDate,
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.en_us,
      looping: true,
    );

    // final snackBar = SnackBar(content: Text("Date Picked $datePicked"));
    if (mounted) {
      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        if (datePicked != null) {
          previewDate =
              '${datePicked.day} - ${datePicked.month} - ${datePicked.year}';
          widget.onDatePicked(datePicked);
        }
      });
    }
  }
}
