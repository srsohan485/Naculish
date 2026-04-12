


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppColor/app_color.dart';
import 'package:naculis/Core/AppImages/app_images.dart';

import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../Auth/View/auth_widget.dart';
import '../Notifications/NotificationsWidget.dart';

class ReferFriendPage extends StatelessWidget {
  const ReferFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.bacgroundcolor,
      body: Column(
        children: [
          AppBar(),
          Expanded(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Illustration
                  Image.asset(
                    AppImages.Refer
                  ),
                  SizedBox(height: 28.h),

                  // Title
                  Text(
                    'Refer a Friend &\nGet 50% off',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.instance.black,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // Refer Button
                  PrimaryButton(
                    label: 'Refer',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          MainBottomNavBar(),
        ],
      ),
    );
  }
}