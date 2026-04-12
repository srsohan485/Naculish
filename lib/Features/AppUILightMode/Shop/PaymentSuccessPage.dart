

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/BottomNavBar/BottomNavBar.dart';

import '../../../Core/AppBar/AppBar.dart';
import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/PrimaryButton/PrimaryButton.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.box,
      body: Column(
        children: [
          AppBar(title: 'Payment Method'),
          Expanded(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tilted card illustration
                  Transform.rotate(
                    angle: -0.3,
                    child: Image.asset(
                      AppImages.VisaCardBackPart,
                      height: 160.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Title
                  Text(
                    'Successfully Paid',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.instance.orange,
                    ),
                  ),
                  SizedBox(height: 14.h),

                  // Description
                  Text(
                    'You have successfully signed up for Business user. Let\'s setup your Business now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.instance.black,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // Finish button
                  PrimaryButton(
                    label: 'Finish',
                    onTap: () => Navigator.popUntil(
                        context, (route) => route.isFirst),
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