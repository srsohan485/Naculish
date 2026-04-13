// ─── SCREEN 1: QUEST MENU ─────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';




class QuestMenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const QuestMenuButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 22.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.instance.orange,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          children: [
            Text('🏆', style: TextStyle(fontSize: 28.sp)),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class QuestCard extends StatelessWidget {
  final String badge;
  final String reward;
  final String title;
  final String task;
  final String progress;
  final double progressValue;
  final String percent;

  const QuestCard({
    required this.badge,
    required this.reward,
    required this.title,
    required this.task,
    required this.progress,
    required this.progressValue,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.instance.green100,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: Basic badge + reward
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 3.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.instance.green500,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.instance.titleTextColor,
                  ),
                ),
              ),
              Text(
                reward,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.instance.titleTextColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // Quest title
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.instance.titleTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 4.h),

          // Quest task description
          Center(
            child: Text(
              task,
              style: TextStyle(
                fontSize: 11.sp,
                color: AppColors.instance.subTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 12.h),

          // Progress bar row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          progress,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.instance.subTextColor,
                          ),
                        ),
                        Text(
                          percent,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.instance.subTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: LinearProgressIndicator(
                        value: progressValue,
                        minHeight: 7.h,
                        backgroundColor: AppColors.instance.white500,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.instance.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── SHARED: QUEST HEADER ─────────────────────────────────────────────────────

class QuestHeader extends StatelessWidget {
  final String title;
  const QuestHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.instance.loginBtnColor,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      child: Column(
        children: [
          Text('🏆', style: TextStyle(fontSize: 28.sp)),
          SizedBox(height: 6.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            AppStrings.questDescription,
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ─── SHARED: QUEST STAT ROW ───────────────────────────────────────────────────

class QuestStatRow extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String label;
  final String value;
  final bool isBold;
  final double valueFontSize;

  const QuestStatRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    this.isBold = false,
    required this.valueFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Text(icon, style: TextStyle(fontSize: 18.sp)),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight:
                isBold ? FontWeight.w700 : FontWeight.normal,
                color: AppColors.instance.titleTextColor,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize,
              fontWeight: FontWeight.w900,
              color: AppColors.instance.titleTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SHARED: QUEST DIVIDER ────────────────────────────────────────────────────

class QuestDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.instance.green500,
      thickness: 1,
      height: 1,
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
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
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
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
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