import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/custom_icon_buton.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/dashboard/profile/others_profile/others_profile_page.dart';
import 'package:icons_plus/icons_plus.dart';

class AllMatchesPage extends StatefulWidget {
  const AllMatchesPage({super.key});

  @override
  State<AllMatchesPage> createState() => _AllMatchesPageState();
}

class _AllMatchesPageState extends State<AllMatchesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 25,
        title: const Text('All matches'),
      ),
      body: SizedBox(
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(15, (index) => profileContainer()),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileContainer() {
    return InkWell(
      onTap: () {
        if (mounted) {
          navigate(context: context, child: const OthersProfilePage());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          width: 310.w,
          height: 270.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                AppDemoImages.femalePP2,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButon(
                      icon: Icon(
                        Bootstrap.heart,
                        color: AppColor.whiteText,
                      ),
                    ),
                    const Gap(7),
                    CustomIconButon(
                      icon: Icon(
                        Icons.send_outlined,
                        color: AppColor.whiteText,
                      ),
                    ),
                    const Gap(7),
                    CustomIconButon(icon: Image.asset(AppIcons.bubbleIcon)),
                    const Gap(7),
                    CustomIconButon(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColor.whiteText,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 15,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elizabeth',
                        style: TextStyle(
                            color: AppColor.whiteText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '(28 yrs) 5ft 4in',
                        style: TextStyle(color: AppColor.whiteText),
                      ),
                      Text(
                        'IT Software Engineer',
                        style: TextStyle(color: AppColor.whiteText),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
