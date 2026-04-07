

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import 'HomeWidget.dart';

class HomeMapScreen extends StatelessWidget {
  const HomeMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            Expanded(
              child: Stack(
                children: [
                  // Road image as background
                  Positioned.fill(
                    child: Image.asset(
                      AppImages.Rodeimage,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  // Orange building right top
                  Positioned(
                    top: 30.h,
                    right: 140.w,
                    child: Image.asset(AppImages.building,
                        width: 60.w, height: 80.h),
                  ),
                  // Orange building right middle
                  Positioned(
                    top: 180.h,
                    right: 15.w,
                    child: Image.asset(AppImages.building,
                        width: 55.w, height: 75.h),
                  ),
                  // Orange building right lower
                  Positioned(
                    top: 350.h,
                    right: 20.w,
                    child: Image.asset(AppImages.building,
                        width: 55.w, height: 75.h),
                  ),
                  // Dark building left middle
                  Positioned(
                    top: 320.h,
                    left: 110.w,
                    child: Image.asset(AppImages.buildingblack,
                        width: 55.w, height: 80.h),
                  ),
                  // Dark building left bottom
                  Positioned(
                    bottom: 70.h,
                    left: 30.w,
                    child: Image.asset(AppImages.buildingblack,
                        width: 50.w, height: 70.h),
                  ),
                  // Avenue sign top left
                  Positioned(
                    top: 60.h,
                    left: 25.w,
                    child:
                    Image.asset(AppImages.avenue, width: 40.w, height: 40.h),
                  ),
                  // Direction sign mid
                  Positioned(
                    top: 230.h,
                    left: 160.w,
                    child: Image.asset(AppImages.diration,
                        width: 35.w, height: 40.h),
                  ),
                  // Direction black sign lower
                  Positioned(
                    top: 440.h,
                    right: 190.w,
                    child: Image.asset(AppImages.dirationblack,
                        width: 35.w, height: 35.h),
                  ),
                ],
              ),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}