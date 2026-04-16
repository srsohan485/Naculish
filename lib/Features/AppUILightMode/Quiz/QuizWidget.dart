import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Quiz/QuizResultScreen.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import '../Speak/ChatScreen.dart';
import '../Speak/SpeakScreen.dart';

// ── Quiz Card ─────────────────────────────────────────────────────────────────
class QuizCard extends StatelessWidget {
  final int questionNumber;
  const QuizCard({required this.questionNumber});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: colors.card, // ✅
        borderRadius: BorderRadius.circular(14.r),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Question text
          Container(
            color: colors.inputFill, // ✅
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
              child: Text(
                '$questionNumber. ${AppStrings.slangQuestion}',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.normalText, // ✅
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Type / Speak toggle
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primaryBtn, // ✅
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('🤙', style: TextStyle(fontSize: 14.sp)),
                      SizedBox(width: 6.w),
                      Text(AppStrings.type,
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SpeakScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.accentOrange, // ✅
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mic, color: Colors.white, size: 16.sp),
                      SizedBox(width: 6.w),
                      Text(AppStrings.speak,
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Answer text field
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: colors.boxBg, // ✅
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              AppStrings.typeYourAnswer,
              style: TextStyle(fontSize: 12.sp, color: colors.hintText),
            ),
          ),
          SizedBox(height: 12.h),

          // Submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizResultScreen())),
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primaryBtn, // ✅
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                elevation: 0,
              ),
              child: Text(AppStrings.submitYourAnswer,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Quiz Header ───────────────────────────────────────────────────────────────
class QuizHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const QuizHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      color: colors.primaryBtn, // ✅
      child: Column(
        children: [
          Text(title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 2.h),
          Text(subtitle,
              style: TextStyle(fontSize: 12.sp, color: Colors.white70)),
        ],
      ),
    );
  }
}

// ── Result Stat Card ──────────────────────────────────────────────────────────
class ResultStatCard extends StatelessWidget {
  final String label;
  final String icon;
  final String value;
  final Color iconColor;

  const ResultStatCard({
    required this.label,
    required this.icon,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: colors.card, // ✅
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(fontSize: 11.sp, color: colors.subText, fontWeight: FontWeight.w500)),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(icon, style: TextStyle(fontSize: 16.sp)),
              SizedBox(width: 4.w),
              Text(value,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: colors.normalText)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Result Button ─────────────────────────────────────────────────────────────
class ResultButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const ResultButton({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(label,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: textColor),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

// ── Quiz Top Stats Bar ────────────────────────────────────────────────────────
class QuizTopStatsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      width: double.infinity,
      color: colors.accentOrange, // ✅
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
        Text(value,
            style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}