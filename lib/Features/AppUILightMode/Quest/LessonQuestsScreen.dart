

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import 'QuestWidget.dart';

class LessonQuestsScreen extends StatelessWidget {
  const LessonQuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            QuestHeader(title: AppStrings.lessonQuests),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.instance.green100,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    children: [
                      // Level row
                      QuestStatRow(
                        icon: '⭐',
                        iconColor: AppColors.instance.orange,
                        label: AppStrings.level,
                        value: AppStrings.levelOne,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),

                      QuestDivider(),

                      // Total Lesson row
                      QuestStatRow(
                        icon: '📚',
                        iconColor: AppColors.instance.orange,
                        label: AppStrings.totalLesson,
                        value: AppStrings.totalLessonValue,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),

                      QuestDivider(),

                      // Total XP row
                      QuestStatRow(
                        icon: '⚡',
                        iconColor: AppColors.instance.orange,
                        label: AppStrings.totalxp,
                        value: AppStrings.totalXPValue,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),

                      SizedBox(height: 16.h),

                      // Divider line
                      Divider(
                        color: AppColors.instance.green300,
                        thickness: 1,
                      ),

                      SizedBox(height: 8.h),

                      // Complete Lesson row
                      QuestStatRow(
                        icon: '📚',
                        iconColor: AppColors.instance.orange,
                        label: AppStrings.completeLesson,
                        value: AppStrings.totalLessonValue,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),

                      QuestDivider(),

                      // Earned XP row
                      QuestStatRow(
                        icon: '⚡',
                        iconColor: AppColors.instance.orange,
                        label: AppStrings.earnedXP,
                        value: AppStrings.earnedXPValue,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MainBottomNavBar(),
          ],
        ),
      ),
    );
  }
}