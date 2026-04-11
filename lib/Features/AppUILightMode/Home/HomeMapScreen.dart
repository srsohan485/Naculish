

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import 'HomeAvenueScreen.dart';
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
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 1200.h, // 👈 বড় height = scroll enable
                  child: Stack(
                    children: [
                      /// 🌍 SMALL ROAD (centered)
                      Positioned(
                        top: 50.h,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Image.asset(
                            AppImages.Rodeimage,
                            width: 260.w,   // 👈 road slim
                            height: 700.h,  // 👈 road ছোট
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      /// 🟧 Buildings (road এর পাশে align)
                      Positioned(
                        top: 80.h,
                        right: 40.w,
                        child: Image.asset(AppImages.building,
                            width: 70.w, height: 70.h),
                      ),

                      Positioned(
                        top: 220.h,
                        right: 30.w,
                        child: Image.asset(AppImages.building,
                            width: 85.w, height: 80.h),
                      ),

                      Positioned(
                        top: 500.h,
                        right: 60.w,
                        child: Image.asset(AppImages.building,
                            width: 60.w, height: 70.h),
                      ),

                      Positioned(
                        top: 250.h,
                        left: 30.w,
                        child: Image.asset(AppImages.buildingblack,
                            width: 60.w, height: 80.h),
                      ),

                      Positioned(
                        top: 700.h,
                        left: 20.w,
                        child: Image.asset(AppImages.buildingblack,
                            width: 55.w, height: 75.h),
                      ),

                      /// 👉 Clickable Direction
                      Positioned(
                        top: 200.h,
                        left: 140.w,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeAvenueScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            AppImages.diration,
                            width: 40.w,
                            height: 40.h,
                          ),
                        ),
                      ),

                      /// 🛣️ Avenue
                      Positioned(
                        top: 350.h,
                        left: 180.w,
                        child: Image.asset(
                          AppImages.avenue,
                          width: 45.w,
                          height: 45.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}