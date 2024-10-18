import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/image_picker_function.dart';

class AddCoverPhotoPage extends StatefulWidget {
  const AddCoverPhotoPage({super.key});

  @override
  State<AddCoverPhotoPage> createState() => _AddCoverPhotoPageState();
}

class _AddCoverPhotoPageState extends State<AddCoverPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Upload'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            const Text(
                'Please upload picture of Passport, License or PAN Card'),
            const Spacer(),
            InkWell(
              onTap: () {
                imagePickerFunction(context);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primary.withOpacity(.4),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 35,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onTap: () {},
                  text: 'Later',
                  width: .45.sw,
                  backgroundColor: AppColor.grey,
                ),
                CustomButton(
                  onTap: () {},
                  text: 'Later',
                  width: .45.sw,
                ),
              ],
            ),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
