import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'ContactWidget.dart' hide BottomNavBar;

class ReferFriendPage extends StatelessWidget {
  const ReferFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: Column(
        children: [
          AppBar(title: 'Refer a Friend'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.Refer),
                  SizedBox(height: 28.h),
                  Text(
                    'Refer a Friend &\nGet 50% off',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: colors.normalText, // ✅
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  PrimaryButton(
                    label: 'Refer',
                    onTap: () {},
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