import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/Theme/app_theme_colors.dart';

// ── Model ─────────────────────────────────────────────────────────────────────
enum NotifType { discount, success }

class NotifItem {
  final String title;
  final String desc;
  final NotifType type;

  const NotifItem({
    required this.title,
    required this.desc,
    required this.type,
  });
}

// ── App Bar ───────────────────────────────────────────────────────────────────
class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      color: colors.background, // ✅
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8.h,
        left: 16.w,
        right: 16.w,
        bottom: 12.h,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Icon(
                Icons.chevron_left,
                size: 28.sp,
                color: colors.normalText, // ✅
              ),
            ),
          ),
          Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: colors.normalText, // ✅
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Label ─────────────────────────────────────────────────────────────
class SectionLabel extends StatelessWidget {
  final String label;
  const SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Text(
      label,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: colors.normalText, // ✅
      ),
    );
  }
}

// ── Notification Card ─────────────────────────────────────────────────────────
class NotifCard extends StatelessWidget {
  final NotifItem item;
  const NotifCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅
    final isDiscount = item.type == NotifType.discount;

    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.card, // ✅
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
              color: isDiscount
                  ? colors.accentOrange.withOpacity(0.12) // ✅
                  : colors.success.withOpacity(0.12),     // ✅
              shape: BoxShape.circle,
            ),
            child: Icon(
              isDiscount ? Icons.notifications_outlined : Icons.check_circle,
              color: isDiscount ? colors.accentOrange : colors.success, // ✅
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: colors.normalText, // ✅
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  item.desc,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: colors.subText, // ✅
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bottom Navigation ─────────────────────────────────────────────────────────
class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

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
      color: colors.bottomNavBackground, // ✅
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navIcons
            .map(
              (icon) => GestureDetector(
            onTap: () {},
            child: Image.asset(icon, width: 26.w, height: 26.h),
          ),
        )
            .toList(),
      ),
    );
  }
}