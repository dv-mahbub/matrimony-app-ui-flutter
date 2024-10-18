import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_bou/component/constant/images.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: [
    //     Image.asset(
    //       AppImages.bgImage,
    //       height: 1.sh,
    //       width: 1.sw,
    //       fit: BoxFit.cover,
    //     ),
    //     SizedBox(height: 1.sh, width: 1.sw, child: child),
    //   ],
    // );
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(AppImages.bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: SafeArea(child: SingleChildScrollView(child: child)),
        ),
      ),
    );
  }
}
