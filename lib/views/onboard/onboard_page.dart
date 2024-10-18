import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/title_text.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/controllers/shared_preference/onboarding_control.dart';
import 'package:hello_bou/views/auth/login_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentPage < 2) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      if (mounted) {
        removeNavigate(context: context, child: const LoginPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    OnboardController.setOnboardStatus(true);
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: //Image.asset(AppImages.splashScreen),
          PageView.builder(
        itemCount: 3,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        controller: _pageController,
        itemBuilder: ((context, index) {
          return pages(index);
        }),
      ),
    );
  }

  Widget pages(int index) {
    String title = index == 0
        ? 'Welcome to Hello Bou!'
        : index == 1
            ? 'Discover Meaningful Connections'
            : 'Join Thousands of Happy Couples';
    String tagLine = index == 0
        ? 'Find Your Perfect Match Today'
        : index == 1
            ? 'Your Journey to Love Begins Here'
            : 'Start Your Love Story Today';
    return Stack(
      children: [
        //background
        index == 0
            ? Image.asset(
                AppImages.onboard1,
                fit: BoxFit.fill,
                width: 1.sw,
              )
            : index == 1
                ? Image.asset(
                    AppImages.onboard2,
                    fit: BoxFit.fill,
                    width: 1.sw,
                  )
                : Image.asset(
                    AppImages.splashScreen,
                    fit: BoxFit.fill,
                    width: 1.sw,
                  ),
        Positioned(
          bottom: 0,
          child: GlassContainer(
            height: 290,
            width: 1.sw,
            blur: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(text: title),
                const Gap(15),
                Text(
                  tagLine,
                  style: TextStyle(color: AppColor.whiteText),
                ),
                const Gap(15),

                //page index indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      3,
                      (kIndex) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: index == kIndex
                              ? AppColor.deepPrimary
                              : AppColor.whiteBg,
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(15),

                CustomButton(
                  onTap: () {
                    _nextPage();
                  },
                  text: 'Continue',
                ),
                const Gap(5),
                TextButton(
                    onPressed: () {
                      if (mounted) {
                        removeNavigate(
                            context: context, child: const LoginPage());
                      }
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: AppColor.primary),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
