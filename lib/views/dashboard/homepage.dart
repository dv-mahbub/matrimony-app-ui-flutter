import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/custom_drawer.dart';
import 'package:hello_bou/component/global_widget/title_text.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/dashboard/all_matches_page.dart';
import 'package:hello_bou/views/dashboard/interest_sent_profiles.dart';
import 'package:hello_bou/views/dashboard/membership/membership_packages_page.dart';
import 'package:hello_bou/views/dashboard/notification/notification_page.dart';
import 'package:hello_bou/views/dashboard/profile/others_profile/others_profile_page.dart';
import 'package:hello_bou/views/dashboard/profile/profile_page.dart';
import 'package:hello_bou/views/dashboard/search/search_page.dart';
import 'package:hello_bou/views/dashboard/shortlisted_page.dart';
import 'package:hello_bou/views/dashboard/viewed_profiles_page.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.dashboardBgImage),
                  fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  customAppbar(),
                  profileHeader(),
                  const Gap(50), // to make bg image bigger
                ],
              ),
            ),
          ),
          //statistics
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  statistics(),

                  //matches
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Matches',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            if (mounted) {
                              navigate(
                                  context: context,
                                  child: const AllMatchesPage());
                            }
                          },
                          child: Text(
                            'See all',
                            style: TextStyle(color: AppColor.primary),
                          ),
                        )
                      ],
                    ),
                  ),

                  //matches
                  SizedBox(
                    height: 290,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, // Number of items in the list
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ProfileCard(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColor.lightPrimary.withOpacity(.4),
        onPressed: () {
          if (mounted) {
            navigate(context: context, child: const SearchPage());
          }
        },
        child: const Icon(Bootstrap.search),
      ),
    );
  }

  Row statistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        statisticsContainer(0, 'Shortlisted', Colors.pink.shade50, () {
          if (mounted) {
            navigate(context: context, child: const ShortlistedPage());
          }
        }),
        statisticsContainer(0, 'Interest sent', Colors.yellow.shade100, () {
          if (mounted) {
            navigate(context: context, child: const InterestSentProfiles());
          }
        }),
        statisticsContainer(
            0, 'Viewed', const Color.fromARGB(255, 253, 187, 209), () {
          if (mounted) {
            navigate(context: context, child: const ViewedProfilesPage());
          }
        }),
      ],
    );
  }

  Widget statisticsContainer(
      int count, String title, Color color, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        alignment: Alignment.center,
        child: Text(
          '$count\n$title',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget profileHeader() {
    return SizedBox(
      width: 320.w,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (mounted) {
                navigate(context: context, child: const ProfilePage());
              }
            },
            child: Stack(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Container(
                  height: 122,
                  width: 122,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(AppDemoImages.malePP),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.whiteBg,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Trust score: 33%',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
          //  Spacer(),
          const Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(text: 'pure i6xve'),
              Text(
                'ID: 23617823600',
                style: TextStyle(color: AppColor.whiteText),
              ),
              SizedBox(
                width: .35.sw,
                child: LinearProgressBar(
                  maxSteps: 10,
                  progressType: LinearProgressBar
                      .progressTypeLinear, // Use Linear progress
                  currentStep: 4,
                  progressColor: AppColor.whiteBg,
                  backgroundColor: AppColor.grey,
                ),
              ),
              Text(
                '40% profile complition',
                style: TextStyle(color: AppColor.whiteText),
              ),
              const Gap(10),
              InkWell(
                onTap: () {
                  if (mounted) {
                    navigate(
                        context: context,
                        child: const MembershipPackagesPage());
                  }
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow,
                  ),
                  child: Row(
                    children: [
                      const Text('Upgrade'),
                      const Gap(5),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.grey,
                        child: Image.asset(AppIcons.crown),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row customAppbar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(AppIcons.drawerIcon),
        ),
        const TitleText(
          text: 'Dashboard',
          fontSize: 21,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Image.asset(AppIcons.bubbleIcon),
        ),
        IconButton(
          onPressed: () {
            if (mounted) {
              navigate(context: context, child: const NotificationPage());
            }
          },
          icon: Icon(
            Bootstrap.bell,
            color: AppColor.whiteText,
            size: 25,
          ),
        )
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context: context, child: const OthersProfilePage()),
      child: Container(
        width: 200,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: Image.asset(
                    AppDemoImages.femalePP,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Roze',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '(28 yrs) 5ft 4in',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sunni Delaware',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'IT Software Engineer',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
