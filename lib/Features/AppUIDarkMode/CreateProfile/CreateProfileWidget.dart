import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import 'CreateVibeScreen.dart';
import 'ProfileFeelingScreen.dart';

// ─── SHARED WIDGETS ──────────────────────────────────────────────────────────

class TopBar extends StatelessWidget {
  final double progress;
  const TopBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
              color: AppColors.instance.titleTextColor,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8.h,
                backgroundColor: AppColors.instance.white500,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.instance.orange,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      )
    );
  }
}


class MascotBubble extends StatelessWidget {
  final String text;
  const MascotBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Mascot bear icon
          Container(
            width: 52.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.instance.orange.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('🐻',
                  style: TextStyle(fontSize: 28.sp)),
            ),
          ),
          SizedBox(width: 10.w),
          // Chat bubble
          Flexible(
            child: Container(
              padding:
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.instance.green100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(4.r),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.instance.titleTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubText extends StatelessWidget {
  final String text;
  const SubText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, bottom: 14.h),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.instance.subTextColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BottomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.instance.loginBtnColor,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.instance.btnTextColor,
          ),
        ),
      ),
    );
  }
}

class LanguageOptionTile extends StatelessWidget {
  final String flag;
  final String label;
  final bool isSelected;

  const LanguageOptionTile({
    required this.flag,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.instance.orange
            : AppColors.instance.green100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(flag, style: TextStyle(fontSize: 20.sp)),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.instance.btnTextColor
                  : AppColors.instance.titleTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class VibeTile extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isSelected;

  const VibeTile({
    required this.emoji,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.instance.orange
            : AppColors.instance.green100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 22.sp)),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.instance.btnTextColor
                  : AppColors.instance.titleTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class MoodTile extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isSelected;

  const MoodTile({
    required this.emoji,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.instance.orange
            : AppColors.instance.green100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 22.sp)),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.instance.btnTextColor
                  : AppColors.instance.titleTextColor,
            ),
          ),
        ],
      ),
    );
  }
}