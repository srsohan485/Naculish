import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import '../Home/HomeWidget.dart';
import 'ShopWidget.dart' hide TopStatsBar, BottomNavBar;

class Withdhrawpaypal extends StatelessWidget {
  const Withdhrawpaypal({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Scaffold(
      backgroundColor: colors.card,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top stats bar ────────────────
              TopStatsBar(),
              SizedBox(height: 16.h),
              // Progress bar
              GemProgressBar(value: 300, max: 1000),
              SizedBox(height: 8.h),
              // Progress label
              Text(
                AppStrings.gemsProgress,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.instance.hintText,
                ),
              ),
              SizedBox(height: 16.h),
              // ── Gem to USD card ────────────────────────────────────────────
              GemToUsdCard(),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
      // ── Bottom Navigation ──────────────────────────────────────────────────

    );
  }
}