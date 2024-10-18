import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/background.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/component/global_widget/custom_radio.dart';
import 'package:hello_bou/component/global_widget/date_picker.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/auth/login_page.dart';
import 'package:hello_bou/views/auth/otp_verification_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
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
                  'Create account',
                  style: TextStyle(color: AppColor.whiteText, fontSize: 18),
                )
              ],
            ),
            const Gap(15),
            GlassContainer(
              blur: 8,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 0,
                          child: Icon(
                            Icons.add_a_photo_rounded,
                            color: AppColor.primary,
                          ),
                        )
                      ],
                    ),
                    const Gap(25),
                    CustomField(hintText: 'Email', controller: emailController),
                    CustomField(
                      hintText: 'Password',
                      controller: passwordController,
                      secured: true,
                    ),
                    CustomField(
                        hintText: 'First name',
                        controller: firstNameController),
                    CustomField(
                        hintText: 'Last name', controller: lastNameController),
                    DatePickerField(
                      onDatePicked: (value) {},
                      initialText: 'D O B',
                    ),
                    const GenderSelection(),

                    //phone number
                    SizedBox(
                      width: 310.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomDropDownButton(
                            items: const ['+91', '+880', '+1', '+12'],
                            width: .22.sw,
                          ),
                          const Spacer(),
                          CustomField(
                            hintText: 'Phone number',
                            controller: phoneController,
                            width: .6.sw,
                          )
                        ],
                      ),
                    ),

                    const CustomDropDownButton(
                        items: ['Country', 'Bangladesh', 'India', 'China']),
                    const CustomDropDownButton(items: ['State', '']),
                    const CustomDropDownButton(
                        items: ['City', 'Dhaka', 'Rajshahi', 'Khulna']),
                    const CustomDropDownButton(items: ['Religion', '']),
                    const CustomDropDownButton(items: ['Mother tongue', '']),
                  ],
                ),
              ),
            ),
            const Gap(15),
            privacyPolicy(),
            const Gap(15),

            CustomButton(
              onTap: () {
                if (mounted) {
                  navigate(
                      context: context, child: const OTPVerificationPage());
                }
              },
              text: 'Continue',
            ),
            const Gap(10),

            //login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: AppColor.whiteText),
                ),
                TextButton(
                  onPressed: () {
                    if (mounted) {
                      removeNavigate(
                          context: context, child: const LoginPage());
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: AppColor.primary),
                  ),
                )
              ],
            ),
            const Gap(15),
          ],
        ),
      ),
    );
  }

  SizedBox privacyPolicy() {
    return SizedBox(
      width: 330.w,
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: 'By submitting you agree to our ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.whiteText,
            ),
          ),
          TextSpan(
            text: 'Privacy Policy ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.whiteText,
            ),
          ),
          TextSpan(
            text: 'Terms of Use',
            style: TextStyle(
              color: AppColor.primary,
            ),
          ),
        ]),
      ),
    );
  }
}

// class GenderSelection extends StatefulWidget {
//   const GenderSelection({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _GenderSelectionState createState() => _GenderSelectionState();
// }

// class _GenderSelectionState extends State<GenderSelection> {
//   String _selectedGender = 'Male';

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           'Gender:',
//           style: TextStyle(fontSize: 16, color: AppColor.whiteText),
//         ),
//         SizedBox(width: 10),
//         Radio<String>(
//           value: 'Male',
//           groupValue: _selectedGender,
//           onChanged: (String? value) {
//             setState(() {
//               _selectedGender = value!;
//             });
//           },
//         ),
//         Text(
//           'Male',
//           style: TextStyle(fontSize: 16, color: AppColor.whiteText),
//         ),
//         SizedBox(width: 10),
//         Radio<String>(
//           value: 'Female',
//           groupValue: _selectedGender,
//           onChanged: (String? value) {
//             setState(() {
//               _selectedGender = value!;
//             });
//           },
//         ),
//         Text(
//           'Female',
//           style: TextStyle(fontSize: 16, color: AppColor.whiteText),
//         ),
//       ],
//     );
//   }
// }

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310.w,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Gender:',
            style: TextStyle(fontSize: 16, color: AppColor.whiteText),
          ),
          const SizedBox(width: 10),
          CustomRadio(
              value: 'Male',
              selectedValue: _selectedGender,
              onClick: (newValue) => _selectedGender = newValue),
          Text(
            'Male',
            style: TextStyle(fontSize: 16, color: AppColor.whiteText),
          ),
          const SizedBox(width: 10),
          CustomRadio(
              value: 'Female',
              selectedValue: _selectedGender,
              onClick: (newValue) => _selectedGender = newValue),
          Text(
            'Female',
            style: TextStyle(fontSize: 16, color: AppColor.whiteText),
          ),
        ],
      ),
    );
  }
}
