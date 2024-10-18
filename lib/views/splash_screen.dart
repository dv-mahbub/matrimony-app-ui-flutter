import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/controllers/shared_preference/onboarding_control.dart';
import 'package:hello_bou/views/auth/login_page.dart';
import 'package:hello_bou/views/onboard/onboard_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      _navigateController();
    });
    super.initState();
  }

  void _navigateController() async {
    bool onboardShowed = await OnboardController.getOnboardStatus();
    if (onboardShowed) {
      if (mounted) {
        removeNavigate(context: context, child: const LoginPage());
      }
    } else {
      if (mounted) {
        removeNavigate(context: context, child: const OnboardPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        width: 1.sw,
        AppImages.splashScreen,
        fit: BoxFit.fill,
      ),
    );
  }
}
