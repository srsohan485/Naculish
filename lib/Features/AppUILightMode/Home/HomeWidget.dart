// ─── SCREEN 1: MAP / ROAD VIEW ───────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';
import 'HomeLessonDetailScreen.dart';




class LessonCard extends StatelessWidget {
  final String title;
  final String lessonsText;
  final String completedText;
  final double progress;
  final String routePath;

  const LessonCard({
    required this.title,
    required this.lessonsText,
    required this.completedText,
    required this.progress,
    required this.routePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.push(routePath);
        });
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.instance.boxcard,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.instance.titleTextColor,
              ),
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6.h,
                backgroundColor: AppColors.instance.white500,
                valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.instance.orange),
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(lessonsText,
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.instance.subTextColor)),
                Text(completedText,
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.instance.subTextColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LessonDetailTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final bool isUnlocked;
  final String? routePath;


  const LessonDetailTile({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.isUnlocked,
    this.routePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.instance.boxcard,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: AppColors.instance.green100,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
          ),
          SizedBox(width: 12.w),
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.instance.titleTextColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.instance.subTextColor,
                  ),
                ),
              ],
            ),
          ),
          // Lock / Start button
          isUnlocked
              ? Expanded(
                child: ElevatedButton(
                            onPressed: isUnlocked && routePath != null
                  ? () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.push(routePath!);
                });
                            }
                  : null,
                            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.instance.loginBtnColor,
                padding: EdgeInsets.symmetric(
                    horizontal: 14.w, vertical: 6.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                elevation: 0,
                            ),
                            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.start,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.play_arrow,
                      color: Colors.white, size: 14.sp),
                ],
                            ),
                          ),
              )
              : Icon(Icons.lock,
              color: AppColors.instance.subTextColor,
              size: 20.sp),
        ],
      ),
    );
  }
}

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
          StatItem(icon: Icons.star, value: '5', color: Colors.white),
          StatItem(icon: Icons.favorite, value: '5', color: Colors.white),
          StatItem(icon: Icons.bolt, value: '300', color: Colors.white),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const StatItem({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16.sp),
        SizedBox(width: 4.w),
        Text(value,
            style: TextStyle(
                color: color,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold
            )
        ),
      ],
    );
  }
}

