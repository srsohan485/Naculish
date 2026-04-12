

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppImages/app_images.dart';
import 'package:naculis/Features/AppUILightMode/Quiz/QuizWidget.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),

                    // Trophy image in bordered box
                    Image.asset(AppImages.Tropy,
                        width: 300.w,height: 300.h,
                      ),


                    SizedBox(height: 16.h),

                    // Congratulations text
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          AppColors.instance.orange,
                          AppColors.instance.loginBtnColor,
                        ],
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
                            iconColor: AppColors.instance.start,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ResultStatCard(
                            label: AppStrings.amazing,
                            icon: '🎯',
                            value: AppStrings.percentage,
                            iconColor: AppColors.instance.orange,
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
                        color: AppColors.instance.titleTextColor,
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
                            color: AppColors.instance.titleTextColor,
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
                            backgroundColor: AppColors.instance.loginBtnColor,
                            textColor: Colors.white,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ResultButton(
                            label: AppStrings.stringtakenewquiz,
                            backgroundColor: AppColors.instance.loginBtnColor,
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