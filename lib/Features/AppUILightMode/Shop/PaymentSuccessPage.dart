import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppBar/AppBar.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'ShopWidget.dart' hide BottomNav;

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: Column(
        children: [
          MainAppBar(title: 'Payment Method'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -0.3,
                    child: Image.asset(AppImages.VisaCardBackPart, height: 160.h, fit: BoxFit.contain),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Successfully Paid',
                    style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700, color: colors.accentOrange),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'You have successfully signed up for Business user. Let\'s setup your Business now',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.sp, color: colors.normalText, height: 1.5),
                  ),
                  SizedBox(height: 36.h),
                  PrimaryButtonm(
                    label: 'Finish',
                    onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}