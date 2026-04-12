import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../Home/HomeWidget.dart';
import 'ShopWidget.dart' hide TopStatsBar, BottomNavBar;

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.box,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top stats bar ──────────────────────────────────────────────
              TopStatsBar(),
              SizedBox(height: 16.h),

              // ── Gems Available card ────────────────────────────────────────
              GemsAvailableCard(),
              SizedBox(height: 14.h),

              // ── Heart Recharge card ────────────────────────────────────────
              HeartRechargeCard(),
              SizedBox(height: 14.h),

              // ── Premium Subscription card ──────────────────────────────────
              PremiumSubscriptionCard(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
      // ── Bottom Navigation ──────────────────────────────────────────────────

    );
  }
}