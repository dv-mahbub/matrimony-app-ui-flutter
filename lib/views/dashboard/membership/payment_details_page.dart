import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hello_bou/component/constant/colors.dart';

class PaymentDetailsPage extends StatelessWidget {
  final String title;
  final int durationMonth;
  final int contacts;
  final int price;
  final int pricePerMonth;
  const PaymentDetailsPage(
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
        title: const Text('Payment details'),
      ),
      body: SizedBox(
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTitle('Order details'),
                    customDivider(),
                    textRow(
                        '$title ($durationMonth months)', 'INR $price', false),
                    textRow('Dicount', 'INR 0', false),
                    customDivider(),
                    textRow('Total', 'INR $price', true),
                  ],
                ),
              ),
              const Gap(20),
              customContainer(
                child: Column(
                  children: [
                    customTitle('Apply coupon'),
                    customDivider(),
                    Row(
                      children: [
                        const Expanded(
                            child: TextField(
                          decoration:
                              InputDecoration(border: UnderlineInputBorder()),
                        )),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Apply',
                            style: TextStyle(color: AppColor.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }

  Row textRow(String text1, String text2, bool isTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: isTotal ? AppColor.blackText : AppColor.grey,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            color: isTotal ? AppColor.blackText : AppColor.grey,
          ),
        ),
      ],
    );
  }

  Widget customDivider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 1.sw,
        color: AppColor.primary.withOpacity(.35),
        height: 1,
      ),
    );
  }

  Text customTitle(String name) {
    return Text(
      name,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColor.blackText.withOpacity(.6)),
    );
  }

  Container customContainer({required Widget child}) {
    return Container(
      width: 310.w,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.whiteBg,
        border: Border.all(
          color: AppColor.primary.withOpacity(.6),
        ),
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey.withOpacity(.4),
            blurRadius: 1,
            offset: const Offset(2, 2),
          ),
          BoxShadow(
            color: AppColor.grey.withOpacity(.4),
            blurRadius: 1,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: child,
    );
  }
}
