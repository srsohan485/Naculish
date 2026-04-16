import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppImages/app_images.dart';
import 'package:naculis/Features/AppUILightMode/Quiz/QuizWidget.dart';

import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.background, // ✅
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    Image.asset(AppImages.Tropy, width: 300.w, height: 300.h),
                    SizedBox(height: 16.h),

                    // Congratulations — gradient text
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [colors.accentOrange, colors.primaryBtn], // ✅
                      ).createShader(bounds),
                      child: Text(
                        AppStrings.congratulations,
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // XP + Amazing row
                    Row(
                      children: [
                        Expanded(
                          child: ResultStatCard(
                            label: AppStrings.totalXP,
                            icon: '⚡',
                            value: '10',
                            iconColor: colors.star, // ✅
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ResultStatCard(
                            label: AppStrings.amazing,
                            icon: '🎯',
                            value: AppStrings.percentage,
                            iconColor: colors.accentOrange, // ✅
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // Earned Gems
                    Text(
                      AppStrings.earnedGems,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: colors.normalText, // ✅
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('💎', style: TextStyle(fontSize: 28.sp)),
                        SizedBox(width: 8.w),
                        Text(
                          AppStrings.gemsValue,
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w900,
                            color: colors.normalText, // ✅
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: ResultButton(
                            label: AppStrings.shareresults,
                            backgroundColor: colors.primaryBtn, // ✅
                            textColor: Colors.white,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ResultButton(
                            label: AppStrings.stringtakenewquiz,
                            backgroundColor: colors.primaryBtn, // ✅
                            textColor: Colors.white,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}