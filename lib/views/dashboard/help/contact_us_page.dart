import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Column(
            children: [
              const Gap(8),
              Container(
                width: 320.w,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.whiteBg,
                  border: Border.all(
                      color: AppColor.primary.withOpacity(.5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.grey.withOpacity(.4),
                      offset: const Offset(2, 2),
                    ),
                    BoxShadow(
                      color: AppColor.grey.withOpacity(.4),
                      offset: const Offset(-2, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CustomField(
                        hintText: 'Enter name', controller: nameController),
                    CustomField(hintText: 'Email', controller: emailController),
                    CustomField(
                      hintText: 'Comment',
                      controller: commentController,
                      maxLine: 4,
                      minLine: 4,
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Security code:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(
                          AppDemoImages.captcha,
                          width: .3.sw,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.replay_outlined),
                        ),
                      ],
                    ),
                    CustomField(
                        hintText: 'Confirm security code',
                        controller: securityCodeController),
                  ],
                ),
              ),
              const Gap(20),
              CustomButton(
                onTap: () {},
                text: 'Submit',
              ),
              const Gap(20),
              const Text('Or'),
              const Gap(15),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Mail us at: ',
                      style: TextStyle(color: AppColor.blackText),
                    ),
                    TextSpan(
                      text: 'Support@hellobou.com',
                      style: TextStyle(color: AppColor.primary),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Call us at: ',
                      style: TextStyle(color: AppColor.blackText),
                    ),
                    TextSpan(
                      text: '+91XXXXX-XXXXX',
                      style: TextStyle(color: AppColor.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    securityCodeController.dispose();
    super.dispose();
  }
}
