import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/global_widget/custom_button.dart';
import 'package:hello_bou/controllers/global_functions/navigate.dart';
import 'package:hello_bou/views/dashboard/membership/payment_details_page.dart';

class PackageDetailsPage extends StatelessWidget {
  final String title;
  final int durationMonth;
  final int contacts;
  final int price;
  final int pricePerMonth;
  const PackageDetailsPage(
      {super.key,
      required this.title,
      required this.durationMonth,
      required this.contacts,
      required this.price,
      required this.pricePerMonth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(title),
      ),
      body: SizedBox(
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 310.w,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColor.whiteBg,
                  border: Border.all(
                      color: AppColor.primary.withOpacity(.7), width: 1),
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: AppColor.grey.withOpacity(.4),
                      offset: const Offset(2, 2),
                    ),
                    BoxShadow(
                      blurRadius: 1,
                      color: AppColor.grey.withOpacity(.4),
                      offset: const Offset(-2, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    Text(
                      'INR $price',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary.withOpacity(.8)),
                    ),
                    Text(
                      'INR $pricePerMonth/per month',
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const Gap(15),

                    //statistics
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        statisticsPreveiwer(true),
                        const Gap(30),
                        statisticsPreveiwer(false),
                      ],
                    ),
                    const Gap(15),

                    //features
                    featureTitile('Paid features'),
                    feature('View All Contact Details'),
                    feature('View Mobile Number'),
                    feature('Initiate Chat'),
                    feature('Send Message'),
                    const Gap(10),
                    featureTitile('Free features'),
                    feature('Create Profile'),
                    feature('Upload Photos'),
                    feature('Define Partner Preference'),
                    feature('Search Relevant Profiles'),
                    feature('View Full Profile'),
                    feature('View Photos'),
                    feature('Send Interest'),
                    feature('Recive Interest'),
                    feature('Block Profile'),
                    feature('View Visitors to Your profile'),
                    feature('Get Auto Matches'),
                  ],
                ),
              ),
              const Gap(15),
              CustomButton(
                onTap: () {
                  navigate(
                      context: context,
                      child: PaymentDetailsPage(
                          title: title,
                          durationMonth: durationMonth,
                          contacts: contacts,
                          price: price,
                          pricePerMonth: pricePerMonth));
                },
                text: 'Buy Now',
              ),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }

  Text feature(String feature) {
    return Text(
      feature,
      style: TextStyle(
          color: AppColor.blackText.withOpacity(.6),
          fontWeight: FontWeight.w300),
    );
  }

  Text featureTitile(String title) => Text(
        title,
        style: TextStyle(color: AppColor.primary, fontWeight: FontWeight.w500),
      );

  Column statisticsPreveiwer(bool isContact) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColor.primary.withOpacity(.2),
              child: Icon(
                isContact ? Icons.person : Icons.calendar_month,
                color: AppColor.primary,
              ),
            ),
            Text(
              '${isContact ? contacts : durationMonth}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(isContact ? 'Contact' : 'Months'),
      ],
    );
  }
}
