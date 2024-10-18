import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/colors.dart';
import 'package:hello_bou/component/constant/images.dart';
import 'package:hello_bou/component/global_widget/background.dart';

class PicturePreviewPage extends StatefulWidget {
  const PicturePreviewPage({super.key});

  @override
  State<PicturePreviewPage> createState() => _PicturePreviewPageState();
}

class _PicturePreviewPageState extends State<PicturePreviewPage> {
  int noOfPicture = 2;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColor.whiteText,
                    size: 30,
                  ),
                ),
              ],
            ),
            BannerCarousel.fullScreen(
              banners: BannerImages.listBanners,
              height: .85.sh,
              animation: false,
              initialPage: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class BannerImages {
  static String banner1 = AppDemoImages.femalePP;
  static String banner2 = AppDemoImages.femalePP2;

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
  ];
}
