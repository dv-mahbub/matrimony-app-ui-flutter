import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/component/global_widget/custom_radio.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/dashboard/membership/package_details_page.dart';
import 'package:hello_bou/views/dashboard/membership/payment_details_page.dart';

class MembershipPackagesPage extends StatefulWidget {
  const MembershipPackagesPage({super.key});

  @override
  State<MembershipPackagesPage> createState() => _MembershipPackagesPageState();
}

class _MembershipPackagesPageState extends State<MembershipPackagesPage> {
  String selectedPackage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 25,
        title: const Text(
          'Renew/Upgrade membership',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SizedBox(
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.membershipPageCover,
                width: 310.w,
              ),
              const Gap(15),
              packageListContainer(
                'Paid',
                [
                  package(
                      name: 'Basic',
                      durationMonth: 3,
                      contacts: 75,
                      price: 2999,
                      pricePerMonth: 999),
                  package(
                      name: 'Super',
                      durationMonth: 3,
                      contacts: 75,
                      price: 2999,
                      pricePerMonth: 999),
                  package(
                      name: 'Advance',
                      durationMonth: 3,
                      contacts: 75,
                      price: 2999,
                      pricePerMonth: 999),
                ],
              ),
              packageListContainer(
                'Personalized',
                [
                  package(
                      name: 'Exclusive',
                      durationMonth: 3,
                      contacts: 75,
                      price: 2999,
                      pricePerMonth: 999),
                  package(
                      name: 'Supreme',
                      durationMonth: 3,
                      contacts: 75,
                      price: 2999,
                      pricePerMonth: 999),
                  package(
                      name: 'Supreme-plus',
                      durationMonth: 3,
                      contacts: 75,
                      price: 2999,
                      pricePerMonth: 999),
                ],
              ),
              const Gap(15),
              CustomButton(
                onTap: () {
                  if (mounted) {
                    navigate(
                        context: context,
                        child: const PaymentDetailsPage(
                            title: 'Supreme-plus',
                            durationMonth: 3,
                            contacts: 75,
                            price: 2999,
                            pricePerMonth: 999));
                  }
                },
                text: 'Buy now',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget package(
      {required String name,
      required int durationMonth,
      required int contacts,
      required int price,
      required int pricePerMonth}) {
    return InkWell(
      onTap: () {
        if (mounted) {
          navigate(
            context: context,
            child: PackageDetailsPage(
                title: name,
                durationMonth: durationMonth,
                contacts: contacts,
                price: price,
                pricePerMonth: pricePerMonth),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: .8.sw,
            color: AppColor.primary.withOpacity(.5),
            height: 1,
          ),
          const Gap(7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadio(
                  value: name,
                  selectedValue: selectedPackage,
                  onClick: (newValue) {
                    if (mounted) {
                      setState(() {
                        selectedPackage = newValue;
                      });
                    }
                  }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$durationMonth months, $contacts contacts',
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'INR $price',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary.withOpacity(.8)),
                  ),
                  Text(
                    'INR $pricePerMonth/per month',
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColor.grey,
                size: 20,
              ),
            ],
          ),
          const Gap(7),
        ],
      ),
    );
  }

  Widget packageListContainer(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 310.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary.withOpacity(.7), width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paid',
              style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const Gap(5),
            ...children,
          ],
        ),
      ),
    );
  }
}
