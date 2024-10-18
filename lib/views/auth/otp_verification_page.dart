import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/background.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/dashboard/homepage.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  static const maxSeconds = 45;
  int seconds = maxSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.whiteBg,
                  ),
                ),
                Text(
                  'OTP verification',
                  style: TextStyle(color: AppColor.whiteText, fontSize: 18),
                )
              ],
            ),
            const Gap(15),
            Text(
              'We have sent a verification code to\n +91xxxxxxx',
              style: TextStyle(color: AppColor.whiteText, fontSize: 18),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomField(
                  hintText: '',
                  controller: otpController1,
                  focusNode: focusNode1,
                  width: 50,
                  keyboardType: TextInputType.number,
                  onChange: (value) {
                    if (value.isNotEmpty) {
                      focusNode2.requestFocus();
                    }
                    if (value.length > 1) {
                      otpController1.text = value[value.length - 1];
                    }
                  },
                ),
                const Gap(5),
                CustomField(
                  hintText: '',
                  controller: otpController2,
                  focusNode: focusNode2,
                  keyboardType: TextInputType.number,
                  width: 50,
                  onChange: (value) {
                    if (value.isNotEmpty) {
                      focusNode3.requestFocus();
                    }
                    if (value.length > 1) {
                      otpController2.text = value[value.length - 1];
                    }
                  },
                ),
                const Gap(5),
                CustomField(
                  hintText: '',
                  controller: otpController3,
                  focusNode: focusNode3,
                  keyboardType: TextInputType.number,
                  width: 50,
                  onChange: (value) {
                    if (value.isNotEmpty) {
                      focusNode4.requestFocus();
                    }
                    if (value.length > 1) {
                      otpController3.text = value[value.length - 1];
                    }
                  },
                ),
                const Gap(5),
                CustomField(
                  hintText: '',
                  controller: otpController4,
                  focusNode: focusNode4,
                  keyboardType: TextInputType.number,
                  width: 50,
                  onChange: (value) {
                    if (value.isNotEmpty) {
                      focusNode4.unfocus();
                    }
                    if (value.length > 1) {
                      otpController4.text = value[value.length - 1];
                    }
                  },
                ),
              ],
            ),
            const Gap(10),
            Text(
              'Resend:  ${formatTime(seconds)}',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteText),
            ),
            Visibility(
              visible: seconds == 0,
              child: TextButton(
                child: Text(
                  'Resend',
                  style: TextStyle(color: AppColor.whiteText),
                ),
                onPressed: () {
                  setState(() {
                    seconds = maxSeconds;
                    startTimer();
                  });
                },
              ),
            ),
            const Gap(40),
            CustomButton(
              onTap: () {
                if (mounted) {
                  navigate(context: context, child: const HomePage());
                }
              },
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secondsStr';
  }
}
