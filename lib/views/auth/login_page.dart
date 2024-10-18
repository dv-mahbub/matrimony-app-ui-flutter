import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/background.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/component/global_widget/title_text.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/auth/register_page.dart';
import 'package:hello_bou/views/dashboard/homepage.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(.23.sh),
            Row(
              children: [
                Gap(.05.sw),
                const TitleText(text: 'Hello There!\nWelcome to Hello Bou'),
              ],
            ),
            const Gap(30),
            GlassContainer(
              blur: 7,
              width: .95.sw,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    CustomField(
                        hintText: 'Enter email id',
                        controller: emailController),
                    CustomField(
                      hintText: 'Enter passwod',
                      controller: passwordController,
                      secured: true,
                    ),
                  ],
                ),
              ),
            ),

            const Gap(5),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password',
                    style: TextStyle(color: AppColor.whiteText),
                  ),
                ),
              ],
            ),
            const Gap(5),
            CustomButton(
              onTap: () {
                if (mounted) {
                  navigate(context: context, child: const HomePage());
                }
              },
              text: 'Login',
            ),
            const Gap(15),
            //divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColor.whiteText.withOpacity(.5),
                    ),
                  ),
                  Text(
                    ' or ',
                    style: TextStyle(color: AppColor.whiteText),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColor.whiteText.withOpacity(.5),
                      height: 5,
                    ),
                  ),
                ],
              ),
            ),

            const Gap(15),
            //social media login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.whiteBg,
                    child: Icon(
                      Bootstrap.apple,
                      color: AppColor.black,
                    ),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.whiteBg,
                    child: Icon(
                      Bootstrap.facebook,
                      color: AppColor.blue,
                    ),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.whiteBg,
                    child: const Icon(
                      Bootstrap.google,
                      // color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(50),
            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: AppColor.whiteText),
                ),
                TextButton(
                  onPressed: () {
                    if (mounted) {
                      navigate(context: context, child: const RegisterPage());
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: AppColor.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
