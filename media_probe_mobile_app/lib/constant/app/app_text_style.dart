import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/constant/app/app_color.dart';

class AppTextStyle {
    static TextStyle regular10Black = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular12Black = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
   static TextStyle semiBold16Black = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
    static TextStyle medium16Grey = const TextStyle(
    fontSize: 16,
    color: AppColor.grey,
    fontWeight: FontWeight.w500,
  );
    static TextStyle regular17White = const TextStyle(
    fontSize: 17,
    color: AppColor.white,
    fontWeight: FontWeight.w400,
  );
  
}

  // - asset: assets/fonts/poppins/Poppins-Regular.ttf
  //         weight: 400
  //       - asset: assets/fonts/poppins/Poppins-Medium.ttf
  //         weight: 500
  //       - asset: assets/fonts/poppins/Poppins-SemiBold.ttf
  //         weight: 600
  //       - asset: assets/fonts/poppins/Poppins-Bold.ttf
  //         weight: 700  