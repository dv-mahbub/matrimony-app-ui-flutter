import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/custom_icon_buton.dart';
import 'package:hello_bou/component/global_widget/profile_picture.dart';
import 'package:hello_bou/component/global_widget/title_text.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/dashboard/profile/others_profile/picture_preview_page.dart';
import 'package:icons_plus/icons_plus.dart';

class OthersProfilePage extends StatefulWidget {
  const OthersProfilePage({super.key});

  @override
  State<OthersProfilePage> createState() => _OthersProfilePageState();
}

class _OthersProfilePageState extends State<OthersProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: AppColor.whiteText,
        backgroundColor: AppColor.primary,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileHeader(),
            DefaultTabController(
              length: 3, // Number of tabs

              child: Column(
                children: [
                  SizedBox(
                    height: .05.sh,
                    child: TabBar(
                      labelColor:
                          AppColor.primary, // Replace with AppColor.primary
                      indicatorColor:
                          AppColor.primary, // Replace with AppColor.primary
                      tabs: const [
                        Tab(text: 'Personal'),
                        Tab(text: 'Family'),
                        Tab(text: 'Preference'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: .51.sh, // Adjust the height as needed
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const Gap(3),
                              customContainer(
                                title: 'Basic information',
                                children: [
                                  textRow('Height', '170cm - 5ft 7in'),
                                  textRow('Marital status', 'Never married'),
                                  textRow('Having kids', ''),
                                  textRow('Living with me', ''),
                                  textRow('Religion', 'Muslim'),
                                  textRow('Caste', 'Sunni'),
                                  textRow('Sub Caste', 'N/A'),
                                  textRow('Mother Tongue', 'Bangla'),
                                  textRow('Complexion', 'Wheatish'),
                                  textRow('Manglik', 'No'),
                                  textRow('Gotra', '-'),
                                  textRow('Date of birth', '11-Oct-1994'),
                                  textRow('Time of birth', '0h-0m-0s'),
                                  textRow('Place of birth', 'Rajshahi'),
                                  const Gap(5),
                                  const Text(
                                    ' About',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  textRow('Description',
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,'),
                                ],
                              ),
                              customContainer(
                                title: 'Education & Career',
                                children: [
                                  textRow('Edu. Qualification', ''),
                                  textRow('Employed As', ''),
                                  textRow('Areal/Field', ''),
                                  textRow('Employed with', ''),
                                  textRow('Annual income', ''),
                                ],
                              ),
                              customContainer(
                                title: 'Address',
                                children: [
                                  textRow('Address1', ''),
                                  textRow('Address2', ''),
                                  textRow('Country', 'Bangladesh'),
                                  textRow('State', ''),
                                  textRow('City', 'Dhaka'),
                                  textRow('Zip code', ''),
                                ],
                              ),
                              customContainer(
                                title: 'Future plans',
                                children: [
                                  textRow('Professional goals', ''),
                                  textRow('Personal goals', ''),
                                ],
                              ),
                              customContainer(
                                title: 'Fair disclosure',
                                children: [
                                  textRow('Current record', 'No'),
                                  textRow('Special class', ''),
                                  textRow('Smoking', ''),
                                  textRow('Drinking', ''),
                                  textRow('Diet', ''),
                                ],
                              ),
                              customContainer(
                                title: 'Social media verification',
                                children: [
                                  textRow('Facebook', 'Not Verified'),
                                  textRow('LinkedIn', 'Not Verified'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const Gap(3),
                              customContainer(
                                title: 'Basic information',
                                children: [
                                  textRow('Father\'s occupation', ''),
                                  textRow('Mother\'s occupation', ''),
                                  textRow('Married sisters', ''),
                                  textRow('Married brothers', ''),
                                  textRow('Unmarried sisters', ''),
                                  textRow('Unmarried brothers', ''),
                                  textRow('Native country', ''),
                                  textRow('State', ''),
                                  textRow('Family value', ''),
                                  textRow('Affluence level', ''),
                                  const Gap(7),
                                  const Text(
                                    ' About',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  textRow('About family',
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const Gap(3),
                              customContainer(
                                title: 'Basic information',
                                children: [
                                  textRow('Age', ''),
                                  textRow('Height', ''),
                                  textRow('Marital status', 'Never married'),
                                  textRow('Complexion', ''),
                                  textRow('Health', ''),
                                  textRow('Manglik', 'No'),
                                  textRow('Special cases', ''),
                                  const Gap(5),
                                  const Text(
                                    ' About',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  textRow('About partner',
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,'),
                                ],
                              ),
                              customContainer(
                                title: 'Country of residence',
                                children: [
                                  textRow('Country of residence', ''),
                                  textRow('State of residence', ''),
                                  textRow('Residency status', ''),
                                  textRow('Country of citizenship', ''),
                                ],
                              ),
                              customContainer(
                                title: 'Education & Career',
                                children: [
                                  textRow('Edu. Qualification', ''),
                                  textRow('Employed As', ''),
                                  textRow('Areal/Field', ''),
                                  textRow('Employed with', ''),
                                  textRow('Annual income', ''),
                                ],
                              ),
                              customContainer(
                                title: 'Social background',
                                children: [
                                  textRow('Religion', ''),
                                  textRow('Mother tongue', ''),
                                  textRow('Caste', ''),
                                  textRow('Sub caste', ''),
                                  textRow('Caste no bar', 'Dhaka'),
                                  textRow('Gotra/Gothram', ''),
                                ],
                              ),
                              customContainer(
                                title: 'Lifestyle & hobbies',
                                children: [
                                  textRow('Diet', ''),
                                  textRow('Smoke', ''),
                                  textRow('Drink', ''),
                                  textRow('Hobies', ''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customContainer(
      {required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 335.w,
        decoration: BoxDecoration(
          color: AppColor.whiteBg,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(.3),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(1, 1),
            ),
            BoxShadow(
              color: AppColor.grey.withOpacity(.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(-1, -1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                ],
              ),
              //   Gap(5),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Row textRow(String parameter, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 140.w,
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            parameter,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 5),
          width: 165.w,
          child: Text(description.isEmpty ? '-' : description),
        ),
      ],
    );
  }

  Widget profileHeader() {
    return Stack(
      children: [
        Image.asset(
          AppDemoImages.femalePP,
          width: 1.sw,
          height: .32.sh,
          fit: BoxFit.fitWidth,
        ),
        InkWell(
          onTap: () {
            log('clicked');
            navigate(context: context, child: const PicturePreviewPage());
          },
          child: Container(
            width: 1.sw,
            height: .32.sh,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        Positioned(
          left: 8,
          bottom: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePicture(
                radius: 35,
                image: AppDemoImages.femalePP,
              ),
              const TitleText(text: 'Zarin'),
              Text(
                'ID: 2361786600',
                style: TextStyle(color: AppColor.whiteText),
              ),
              Row(
                children: [
                  Container(
                    color: AppColor.grey,
                    child: const Icon(
                      Icons.male,
                    ),
                  ),
                  const Gap(8),
                  Image.asset(
                    AppDemoImages.flag,
                    width: 40,
                  ),
                  const Gap(8),
                  Text(
                    'Online',
                    style: TextStyle(color: AppColor.primary),
                  )
                ],
              ),
              Text(
                '(27 Yrs) 170cm - 5ft 7in, Never Married, Bnagladesh.',
                style: TextStyle(color: AppColor.whiteText, fontSize: 12),
              )
            ],
          ),
        ),
        Positioned(
            right: 10,
            top: 15,
            child: Column(
              children: [
                CustomIconButon(
                  icon: Icon(
                    Bootstrap.heart,
                    color: AppColor.whiteText,
                  ),
                ),
                const Gap(5),
                CustomIconButon(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColor.whiteText,
                  ),
                ),
                const Gap(5),
                CustomIconButon(
                  icon: Icon(
                    Icons.workspace_premium_outlined,
                    color: AppColor.whiteText,
                  ),
                ),
                const Gap(5),
                CustomIconButon(icon: Image.asset(AppIcons.bubbleIcon))
              ],
            ))
      ],
    );
  }
}
