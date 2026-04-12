

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import 'HomeWidget.dart';

class HomeAvenueScreen extends StatelessWidget {
  const HomeAvenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        'title': AppStrings.GreetingsIntros,
        'lessons': AppStrings.Lessons,
        'completed': AppStrings.Completed,
        'progress': 1.0,
      },
      {
        'title': AppStrings.VibeCheck,
        'lessons': AppStrings.Lessons,
        'completed': '3 Completed',
        'progress': 0.5,
      },
      {
        'title': AppStrings.Survival,
        'lessons': AppStrings.Lessons,
        'completed': '2 Completed',
        'progress': 0.33,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.instance.box,
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            SizedBox(height: 8.h),
            // Avenue Header Card
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
                    AppStrings.FistAvenue,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppStrings.Foundational,
                    style: TextStyle(
                        fontSize: 12.sp, color: Colors.white70),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppStrings.Greetings,
                    style: TextStyle(
                        fontSize: 11.sp, color: Colors.white60),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: lessons.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final item = lessons[index];
                  return LessonCard(
                    title: item['title'] as String,
                    lessonsText: item['lessons'] as String,
                    completedText: item['completed'] as String,
                    progress: item['progress'] as double,
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