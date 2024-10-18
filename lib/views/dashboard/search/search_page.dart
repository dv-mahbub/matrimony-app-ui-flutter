import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_drawer.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController idController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Image.asset(
              AppIcons.drawerIcon,
              color: AppColor.primary,
            ),
          ),
          title: const Text('Search'),
          bottom: TabBar(
            labelColor: AppColor.primary,
            // dividerColor: AppColor.primary,
            indicatorColor: AppColor.primary,
            tabs: const [
              Tab(text: 'Basic Search'),
              Tab(
                text: 'Search by ID',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            basicSearch(),
            searchByID(),
          ],
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }

  Widget basicSearch() {
    return SingleChildScrollView(
        child: Column(
      children: [
        const Gap(10),
        Container(
          width: 330.w,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.whiteText,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: AppColor.grey.withOpacity(.3),
                offset: const Offset(2, 2),
              ),
              BoxShadow(
                blurRadius: 1,
                color: AppColor.grey.withOpacity(.3),
                offset: const Offset(-2, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I am looking for ',
                      style: TextStyle(color: AppColor.blackText, fontSize: 18),
                    ),
                    TextSpan(
                      text: 'Bride',
                      style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              const Gap(7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownButton(
                    items: const ['Min age', ''],
                    width: 140.w,
                    isBorderRequired: true,
                  ),
                  CustomDropDownButton(
                    items: const ['Max age', ''],
                    isBorderRequired: true,
                    width: 140.w,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownButton(
                    items: const ['Min height', ''],
                    isBorderRequired: true,
                    width: 140.w,
                  ),
                  CustomDropDownButton(
                    items: const ['Max height', ''],
                    isBorderRequired: true,
                    width: 140.w,
                  ),
                ],
              ),
              const CustomDropDownButton(
                  items: ['Select Religion', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select Caste', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select Mother Tongue', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select Marital Status', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select Country', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select State', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select City', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select City', ''], isBorderRequired: true),
              const Gap(20),
              Text(
                'Advaced Search',
                style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const CustomDropDownButton(
                  items: ['Select Annual Income', ''], isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select Educational Qualification', ''],
                  isBorderRequired: true),
              const CustomDropDownButton(
                  items: ['Select Special Cases', ''], isBorderRequired: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownButton(
                    items: const ['Select Manglik', ''],
                    width: 140.w,
                    isBorderRequired: true,
                  ),
                  CustomDropDownButton(
                    items: const ['Select Diet', ''],
                    isBorderRequired: true,
                    width: 140.w,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownButton(
                    items: const ['Select Smoke', ''],
                    width: 140.w,
                    isBorderRequired: true,
                  ),
                  CustomDropDownButton(
                    items: const ['Select Drink', ''],
                    isBorderRequired: true,
                    width: 140.w,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(15),
        CustomButton(
          onTap: () {},
          text: 'Search',
        ),
        const Gap(20),
      ],
    ));
  }

  Widget searchByID() {
    return Column(
      children: [
        const Gap(10),
        SizedBox(
          width: 320.w,
          child: Row(
            children: [
              Expanded(
                child:
                    CustomField(hintText: 'Enter ID', controller: idController),
              ),
              const Gap(4),
              CustomButton(
                onTap: () {},
                width: 60,
                text: 'Go',
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }
}
