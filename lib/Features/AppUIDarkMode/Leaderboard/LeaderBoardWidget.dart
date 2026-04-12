// ─── LEADERBOARD SCREEN ───────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';

// ─── LEADERBOARD HEADER ───────────────────────────────────────────────────────

class LeaderboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.instance.loginBtnColor,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        children: [
          Text(
            AppStrings.leaderboard,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Image.asset(AppImages.Tropy,
          width: 100,height: 100,)
        ],
      ),
    );
  }
}

// ─── LEADERBOARD TILE ─────────────────────────────────────────────────────────

class LeaderboardTile extends StatelessWidget {
  final String position;
  final String name;
  final String score;

  const LeaderboardTile({
    required this.position,
    required this.name,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Position number
          SizedBox(
            width: 28.w,
            child: Text(
              position,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.instance.start,
              ),
            ),
          ),

          SizedBox(width: 8.w),

          // Player avatar

            Image.asset(AppImages.Ellipse,),


          SizedBox(width: 12.w),

          // Player name
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.instance.start,
              ),
            ),
          ),

          // Diamond icon
          Image.asset(AppImages.Vector),

          SizedBox(width: 6.w),

          // Score
          Text(
            score,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.instance.start,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SHARED: TOP STATS BAR ────────────────────────────────────────────────────

class TopStatsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.instance.orange,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatChip(icon: '❤️', value: '5'),
          StatChip(icon: '🔥', value: '3'),
          StatChip(icon: '⭐', value: '5'),
          StatChip(icon: '💎', value: '300'),
        ],
      ),
    );
  }
}

class StatChip extends StatelessWidget {
  final String icon;
  final String value;
  const StatChip({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: TextStyle(fontSize: 14.sp)),
        SizedBox(width: 4.w),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ─── SHARED: BOTTOM NAV BAR ───────────────────────────────────────────────────

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> navIcons = [
      AppImages.Icon1,
      AppImages.Icon2,
      AppImages.Icon3,
      AppImages.Icon4,
      AppImages.Icon5,
      AppImages.Icon6,
    ];

    return Container(
      width: double.infinity,
      color: AppColors.instance.orange,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navIcons
            .map(
              (icon) => GestureDetector(
            onTap: () {},
            child: Image.asset(
              icon,
              width: 26.w,
              height: 26.h,
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}