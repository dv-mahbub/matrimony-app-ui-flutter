import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/auth/login_page.dart';
import 'package:hello_bou/views/dashboard/all_matches_page.dart';
import 'package:hello_bou/views/dashboard/blocked_list_page.dart';
import 'package:hello_bou/views/dashboard/help/contact_us_page.dart';
import 'package:hello_bou/views/dashboard/help/faq_page.dart';
import 'package:hello_bou/views/dashboard/help/feedback_page.dart';
import 'package:hello_bou/views/dashboard/membership/membership_packages_page.dart';
import 'package:hello_bou/views/dashboard/profile/profile_page.dart';
import 'package:hello_bou/views/dashboard/profile/settings/settings_page.dart';
import 'package:hello_bou/views/dashboard/search/search_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool matchesExpanded = false;
  bool searchExpanded = false;
  bool helpExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.whiteBg,
            ),
            child: Column(
              children: [
                //image and name
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      //child: Image.asset(AppDemoImages.malePP),
                      backgroundImage: AssetImage(AppDemoImages.malePP),
                    ),
                    const Gap(15),

                    //welcome text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: TextStyle(color: AppColor.grey),
                        ),
                        Text(
                          'Kazi Arman',
                          style: TextStyle(
                              color: AppColor.blue,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        if (mounted) {
                          Navigator.pop(context);
                        }
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: AppColor.primary.withOpacity(.3),
                ),
                const Text(
                  'Free member',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    if (mounted) {
                      navigate(
                          context: context,
                          child: const MembershipPackagesPage());
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.primary),
                    child: Text(
                      'Upgrade',
                      style: TextStyle(color: AppColor.whiteText),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: AppColor.whiteText),
            title: Text(
              'My Account',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                navigate(context: context, child: const ProfilePage());
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.message, color: AppColor.whiteText),
            title: Text(
              'Messages',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.whiteText,
            ),
            onTap: () {
              // Handle the tap here.
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.group_rounded, color: AppColor.whiteText),
            title: Text(
              'My matches',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              matchesExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 35,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                // navigate(context: context, child: const AllMatchesPage());
                setState(() {
                  matchesExpanded = !matchesExpanded;
                });
              }
            },
          ),
          matchesOptions(),
          ListTile(
            leading: Icon(Icons.search, color: AppColor.whiteText),
            title: Text(
              'Search',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              searchExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 35,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                //  navigate(context: context, child: const SearchPage());
                setState(() {
                  searchExpanded = !searchExpanded;
                });
              }
            },
          ),
          searchOptions(),
          ListTile(
            leading: Image.asset(
              AppIcons.crown,
              color: AppColor.whiteText,
            ),
            title: Text(
              'Upgrage',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                navigate(
                    context: context, child: const MembershipPackagesPage());
              }
            },
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.crown,
              color: AppColor.whiteText,
            ),
            title: Text(
              'Blocked List',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                navigate(context: context, child: const BlockedListPage());
              }
            },
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.crown,
              color: AppColor.whiteText,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                navigate(context: context, child: const Settings());
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: AppColor.whiteText,
            ),
            title: Text(
              'Help',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              helpExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 35,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                setState(() {
                  helpExpanded = !helpExpanded;
                });
              }
            },
          ),
          helpOptions(),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: AppColor.whiteText,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: AppColor.whiteText),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.whiteText,
            ),
            onTap: () {
              if (mounted) {
                removeNavigate(context: context, child: const LoginPage());
              }
            },
          ),
          const Divider()
        ],
      ),
    );
  }

  Visibility matchesOptions() {
    return Visibility(
        visible: matchesExpanded,
        child: Container(
          color: Colors.grey.shade400,
          child: Column(
            children: [
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Preferred match'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Looking for me'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Perfect e-matches'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Shortlisted members'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Members shortlisted me'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'New upload photos'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Viewed contacts by me'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Viewed my contact'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Viewed matrimony wall'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'My matrimony wall'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Recent profile visitors'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Viewed members by me'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const AllMatchesPage());
                    }
                  },
                  text: 'Recently joined'),
            ],
          ),
        ));
  }

  Visibility searchOptions() {
    return Visibility(
        visible: searchExpanded,
        child: Container(
          color: Colors.grey.shade400,
          child: Column(
            children: [
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const SearchPage());
                    }
                  },
                  text: 'Quick search'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const SearchPage());
                    }
                  },
                  text: 'Profile ID search'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const SearchPage());
                    }
                  },
                  text: 'Advance search'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const SearchPage());
                    }
                  },
                  text: 'Search by location'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const SearchPage());
                    }
                  },
                  text: 'Smart search'),
              optionRow(
                  onTap: () {
                    if (mounted) {
                      navigate(context: context, child: const SearchPage());
                    }
                  },
                  text: 'Saved search'),
            ],
          ),
        ));
  }

  Visibility helpOptions() {
    return Visibility(
      visible: helpExpanded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade400,
            child: Column(
              children: [
                optionRow(
                    onTap: () {
                      if (mounted) {
                        navigate(
                            context: context, child: const ContactUsPage());
                      }
                    },
                    text: 'Contact us'),
                optionRow(
                    onTap: () {
                      if (mounted) {
                        navigate(context: context, child: const FeedbackPage());
                      }
                    },
                    text: 'Feedback'),
                optionRow(
                    onTap: () {
                      if (mounted) {
                        navigate(context: context, child: const FAQPage());
                      }
                    },
                    text: 'FAQ'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need assistance?',
                  style: TextStyle(color: AppColor.whiteText, fontSize: 15),
                ),
                Text(
                  'Call at: +918929175332',
                  style: TextStyle(color: AppColor.whiteText, fontSize: 17),
                ),
                Text(
                  '(9:30 AM to 6 PM IST, Mon to Sat)',
                  style: TextStyle(color: AppColor.whiteText, fontSize: 12),
                ),
                const Gap(4),
                Text(
                  'Or email at:',
                  style: TextStyle(color: AppColor.whiteText, fontSize: 15),
                ),
                Text(
                  'feedback@matrimonialsindia.com',
                  style: TextStyle(color: AppColor.whiteText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget optionRow({required Function() onTap, required String text}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const Gap(25),
            const Icon(
              Icons.arrow_forward_ios,
              // color: AppColor.whiteText,
              size: 16,
            ),
            const Gap(5),
            Text(
              text,
              // style: TextStyle(color: AppColor.whiteText),
            ),
          ],
        ),
      ),
    );
  }
}
