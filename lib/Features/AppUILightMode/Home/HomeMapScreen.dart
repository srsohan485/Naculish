import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'HomeWidget.dart';

class HomeMapScreen extends StatelessWidget {
  const HomeMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 1200.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50.h,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Image.asset(
                            AppImages.Rodeimage,
                            width: 260.w,
                            height: 700.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80.h,
                        right: 40.w,
                        child: Image.asset(AppImages.building, width: 70.w, height: 70.h),
                      ),
                      Positioned(
                        top: 220.h,
                        right: 30.w,
                        child: Image.asset(AppImages.building, width: 85.w, height: 80.h),
                      ),
                      Positioned(
                        top: 500.h,
                        right: 60.w,
                        child: Image.asset(AppImages.building, width: 60.w, height: 70.h),
                      ),
                      Positioned(
                        top: 250.h,
                        left: 30.w,
                        child: Image.asset(AppImages.buildingblack, width: 60.w, height: 80.h),
                      ),
                      Positioned(
                        top: 700.h,
                        left: 20.w,
                        child: Image.asset(AppImages.buildingblack, width: 55.w, height: 75.h),
                      ),
                      Positioned(
                        top: 200.h,
                        left: 140.w,
                        child: InkWell(
                          onTap: () {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              context.push('/home/avenue');
                            });
                          },
                          child: Image.asset(AppImages.diration, width: 40.w, height: 40.h),
                        ),
                      ),
                      Positioned(
                        top: 350.h,
                        left: 180.w,
                        child: Image.asset(AppImages.avenue, width: 45.w, height: 45.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}