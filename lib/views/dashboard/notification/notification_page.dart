import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Notifications'),
        ),
        body: SizedBox(
          width: 1.sw,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                notificationListContainer(
                    const Icon(Bootstrap.bell),
                    'You have a new feedback from Helena',
                    'How To Write Better Advertising Graphic designers always manage',
                    'Now'),
                notificationListContainer(
                    const Icon(Bootstrap.bell),
                    'You have a new feedback from Helena',
                    'How To Write Better Advertising Graphic designers always manage',
                    'Now'),
                notificationListContainer(
                    const Icon(Bootstrap.bell),
                    'You have a new feedback from Helena',
                    'How To Write Better Advertising Graphic designers always manage',
                    'Now'),
                notificationListContainer(
                    const Icon(Bootstrap.bell),
                    'You have a new feedback from Helena',
                    'How To Write Better Advertising Graphic designers always manage',
                    'Now'),
              ],
            ),
          ),
        ));
  }

  Widget notificationListContainer(
      Widget icon, String title, String details, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        width: 310.w,
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: AppColor.whiteBg,
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(.5),
              blurRadius: 1,
              offset: const Offset(2, 2),
            ),
            BoxShadow(
              color: AppColor.grey.withOpacity(.5),
              blurRadius: 1,
              offset: const Offset(-2, -2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.primary, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 40,
              child: CircleAvatar(
                backgroundColor: AppColor.primary.withOpacity(.3),
                child: icon,
              ),
            ),
            SizedBox(
              width: .55.sw,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.blackText),
                    ),
                    TextSpan(
                        text: ' “$details”',
                        style: TextStyle(color: AppColor.blackText)),
                  ],
                ),
              ),
            ),
            Text(
              time,
              style: TextStyle(color: AppColor.primary),
            )
          ],
        ),
      ),
    );
  }
}
