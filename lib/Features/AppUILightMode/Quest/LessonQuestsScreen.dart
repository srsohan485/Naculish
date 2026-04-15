import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'QuestWidget.dart';

class LessonQuestsScreen extends StatelessWidget {
  const LessonQuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.background, // ✅
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            QuestHeader(title: AppStrings.lessonQuests),
            Expanded(
              child: SingleChildScrollView(
                padding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: colors.card, // ✅
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    children: [
                      QuestStatRow(
                        icon: '⭐',
                        iconColor: colors.accentOrange, // ✅
                        label: AppStrings.level,
                        value: AppStrings.levelOne,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),
                      QuestDivider(),
                      QuestStatRow(
                        icon: '📚',
                        iconColor: colors.accentOrange, // ✅
                        label: AppStrings.totalLesson,
                        value: AppStrings.totalLessonValue,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),
                      QuestDivider(),
                      QuestStatRow(
                        icon: '⚡',
                        iconColor: colors.accentOrange, // ✅
                        label: AppStrings.totalxp,
                        value: AppStrings.totalXPValue,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),
                      SizedBox(height: 16.h),
                      Divider(color: colors.border, thickness: 1), // ✅
                      SizedBox(height: 8.h),
                      QuestStatRow(
                        icon: '📚',
                        iconColor: colors.accentOrange, // ✅
                        label: AppStrings.completeLesson,
                        value: AppStrings.totalLessonValue,
                        isBold: true,
                        valueFontSize: 18.sp,
                      ),
                      QuestDivider(),
                      QuestStatRow(
                        icon: '⚡',
                        iconColor: colors.accentOrange, // ✅
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
          ],
        ),
      ),
    );
  }
}