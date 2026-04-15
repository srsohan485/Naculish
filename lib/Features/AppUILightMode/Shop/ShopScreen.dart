import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Theme/app_theme_colors.dart';
import 'ShopWidget.dart' hide BottomNav;

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.background, // ✅
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopStatsBar(),
              SizedBox(height: 16.h),
              GemsAvailableCard(),
              SizedBox(height: 14.h),
              HeartRechargeCard(),
              SizedBox(height: 14.h),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}