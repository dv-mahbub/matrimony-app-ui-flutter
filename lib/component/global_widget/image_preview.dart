// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_relatives/components/constants/api_endpoints.dart';
// import 'package:e_relatives/components/constants/color.dart';
// import 'package:e_relatives/components/constants/global_variables.dart';
// import 'package:flutter/material.dart';

// class CustomCachedImage extends StatelessWidget {
//   final String image;
//   final ImageType imageType;
//   final double? height;
//   final double? width;
//   const CustomCachedImage(
//       {super.key,
//       required this.image,
//       required this.imageType,
//       this.height,
//       this.width});

//   @override
//   Widget build(BuildContext context) {
//     String url = '';
//     switch (imageType) {
//       case ImageType.profilePicture:
//         url = '${ApiEndpoints.imageGloblaBaseUrl}/users/$image';
//         break;
//       case ImageType.investigationImage:
//         url = '${ApiEndpoints.imageGloblaBaseUrl}/investigations/$image';
//     }
//     if (image.isEmpty) {
//       return Container();
//     } else {
//       return CachedNetworkImage(
//         height: height ?? 150,
//         width: width ?? 150,
//         imageUrl: url,
//       );
//     }
//   }
// }

// class CustomCircularCachedImage extends StatelessWidget {
//   final String image;
//   final ImageType imageType;
//   final double? height;
//   final double? width;
//   const CustomCircularCachedImage(
//       {super.key,
//       required this.image,
//       required this.imageType,
//       this.height,
//       this.width});

//   @override
//   Widget build(BuildContext context) {
//     String url = '';
//     switch (imageType) {
//       case ImageType.profilePicture:
//         url = '${ApiEndpoints.imageGloblaBaseUrl}/users/$image';
//         break;
//       case ImageType.investigationImage:
//         url = '${ApiEndpoints.imageGloblaBaseUrl}/investigations/$image';
//     }
//     if (image.isEmpty) {
//       return Container(
//         height: height ?? width ?? 150,
//         width: width ?? height ?? 150,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(width: 2, color: AppColor.black),
//             image: DecorationImage(image: AssetImage(GlobalString.person))),
//         //child: Image.asset(GlobalString.person)
//       );
//     } else {
//       return SizedBox(
//         height: height ?? width ?? 150,
//         width: width ?? height ?? 150,
//         child: Container(
//           padding: const EdgeInsets.all(1),
//           decoration: BoxDecoration(
//               borderRadius:
//                   BorderRadius.circular(height == null ? 85 : height! / 1.8),
//               color: Colors.amber),
//           child: ClipRRect(
//             borderRadius:
//                 BorderRadius.circular(height == null ? 85 : height! / 1.8),
//             child: CachedNetworkImage(
//               fit: BoxFit.cover,
//               height: height ?? 150,
//               width: width ?? 150,
//               imageUrl: url,
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }

// enum ImageType {
//   profilePicture,
//   investigationImage;
// }
