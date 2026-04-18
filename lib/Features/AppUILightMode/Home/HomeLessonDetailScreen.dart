import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'HomeWidget.dart';

class HomeLessonDetailScreen extends StatelessWidget {
  const HomeLessonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    final lessonItems = [
      {
        'icon': AppImages.Icon1,
        'title': AppStrings.BasicGreetings,
        'sub': AppStrings.Vocabulary,
        'unlocked': true,
        'routePath': '/home/lesson-detail/basic-greetings',
      },
      {
        'icon': AppImages.Icon2,
        'title': AppStrings.WhatGood,
        'sub': AppStrings.Listening,
        'unlocked': true,
        'routePath': '/home/lesson-detail/whats-good',
      },
      {
        'icon': AppImages.Icon3,
        'title': AppStrings.IntroYourself,
        'sub': AppStrings.Pronunciation,
        'unlocked': false,
        'routePath': '/home/lesson-detail/intro-yourself',
      },
    ];

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: colors.primaryBtn, // ✅
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
                    style: TextStyle(fontSize: 12.sp, color: Colors.white70),
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
                  return IntrinsicHeight(
                    child: LessonDetailTile(
                      iconPath: item['icon'] as String,
                      title: item['title'] as String,
                      subtitle: item['sub'] as String,
                      isUnlocked: item['unlocked'] as bool,
                      routePath: item['routePath'] as String?,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}