import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/component/global_widget/date_picker.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class PersonalBasicEditPage extends StatefulWidget {
  const PersonalBasicEditPage({super.key});

  @override
  State<PersonalBasicEditPage> createState() => _PersonalBasicEditPageState();
}

class _PersonalBasicEditPageState extends State<PersonalBasicEditPage> {
  TextEditingController aboutController = TextEditingController();
  TextEditingController subCasteController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  String previewTime = 'Select Time';

  @override
  void dispose() {
    aboutController.dispose();
    subCasteController.dispose();
    placeOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Basic information',
      onTap: () {
        if (mounted) {
          Navigator.pop(context);
        }
      },
      children: [
        const Gap(10),
        CustomField(
          hintText: 'Write about yourself',
          controller: aboutController,
          maxLine: 3,
          minLine: 3,
        ),
        const CustomDropDownButton(items: ['Select Height', '']),
        const CustomDropDownButton(items: ['Select Height', '']),
        const CustomDropDownButton(items: ['Select Marital Status', '']),
        const CustomDropDownButton(items: ['Select Religion', '']),
        const CustomDropDownButton(items: ['Select Caste', '']),
        CustomField(
          controller: subCasteController,
          hintText: 'Sub Caste',
        ),
        const CustomDropDownButton(items: ['Select Mother Tongue', '']),
        const CustomDropDownButton(items: ['Select Complexion', '']),
        const CustomDropDownButton(items: ['Select Mangolik', '']),
        const CustomDropDownButton(items: ['Select Gotra', '']),
        DatePickerField(
          onDatePicked: (value) {},
          initialText: 'Select Date of Birth',
        ),
        // TimePickerDialog(initialTime: TimeOfDay.now()),
        timePicker(),
        CustomField(
            hintText: 'Place of Birth', controller: placeOfBirthController),
      ],
    );
  }

  timePicker() {
    return InkWell(
      onTap: () async {
        TimeOfDay pickedTime = await showDialog(
            context: context,
            builder: (context) {
              return TimePickerDialog(initialTime: TimeOfDay.now());
            });
        if (mounted) {
          setState(() {
            previewTime = '${pickedTime.hour}h : ${pickedTime.minute}m : 00s';
          });
        }
      },
      child: Container(
        width: 310.w,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Stack(
          children: [
            Container(
              height: 45,
              width: 310.w,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                color: AppColor.whiteBg,
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text(previewTime)),
            ),
            Positioned(
              right: 0,
              child: SizedBox(
                // height: double.infinity,
                width: 40.w,
                height: 35.sp,
                child: Icon(
                  Icons.timer_outlined,
                  color: AppColor.blackText.withOpacity(.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
