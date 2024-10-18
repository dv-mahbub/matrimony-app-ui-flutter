import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/custom_alert_dialog.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_drawer.dart';
import 'package:hello_bou/component/global_widget/title_text.dart';

class BlockedListPage extends StatefulWidget {
  const BlockedListPage({super.key});

  @override
  State<BlockedListPage> createState() => _BlockedListPageState();
}

class _BlockedListPageState extends State<BlockedListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            customAppbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: .02.sw,
                      runSpacing: .02.sw,
                      children: [
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                        profileContainer(),
                      ],
                    ),
                    const Gap(5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack profileContainer() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            AppDemoImages.femalePP2,
            fit: BoxFit.cover,
            height: .6.sw,
            width: .45.sw,
          ),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elizabeth',
                style: TextStyle(
                    color: AppColor.whiteText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '(28 yrs) 5ft 4in',
                style: TextStyle(color: AppColor.whiteText),
              ),
              Text(
                'IT Software Engineer',
                style: TextStyle(color: AppColor.whiteText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onTap: () {
                      if (mounted) {
                        customAlertDialog(context);
                      }
                    },
                    text: 'Unblock',
                    backgroundColor: AppColor.grey,
                    height: 36,
                    width: .42.sw,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Row customAppbar() {
    return Row(
      children: [
        const Gap(5),
        IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            AppIcons.drawerIcon,
            color: AppColor.blackText,
          ),
        ),
        const Gap(10),
        TitleText(
          text: 'Blocked Users',
          color: AppColor.blackText,
          fontSize: 21,
        ),
      ],
    );
  }
}
