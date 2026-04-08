

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Quiz/QuizIntroYourselfScreen.dart';
import 'package:naculis/Features/AppUILightMode/Quiz/QuizWhatsGoodScreen.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';
import '../Quiz/QuizBasicGreetingsScreen.dart';
import 'HomeWidget.dart';

class HomeLessonDetailScreen extends StatelessWidget {
  const HomeLessonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessonItems = [
      {
        'icon': AppImages.Icon1,
        'title': AppStrings.BasicGreetings,
        'sub': AppStrings.Vocabulary,
        'unlocked': true,
        'page': QuizBasicGreetingsScreen(), // 👈 add this
      },
      {
        'icon': AppImages.Icon2,
        'title': AppStrings.WhatGood,
        'sub': AppStrings.Listening,
        'unlocked': true,
        'page': QuizWhatsGoodScreen(),
      },
      {
        'icon': AppImages.Icon3,
        'title': AppStrings.IntroYourself,
        'sub': AppStrings.Pronunciation,
        'unlocked': false,
        'page': QuizIntroYourselfScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.instance.background,
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            SizedBox(height: 8.h),
            // Header
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.instance.loginBtnColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.GreetingsIntros,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppStrings.FistAvenue,
                    style: TextStyle(
                        fontSize: 12.sp, color: Colors.white70),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: lessonItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final item = lessonItems[index];
                  return LessonDetailTile(
                    iconPath: item['icon'] as String,
                    title: item['title'] as String,
                    subtitle: item['sub'] as String,
                    isUnlocked: item['unlocked'] as bool,
                    destination: item['page'] as Widget,
                  );
                },
              ),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}