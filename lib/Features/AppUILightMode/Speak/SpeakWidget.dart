// ─── SCREEN 1: SPEAK SCREEN WITH EARN GEMS DIALOG ────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Speak/ChatScreen.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';



// ─── EARN GEMS DIALOG ─────────────────────────────────────────────────────────

class EarnGemsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 28.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.instance.green100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close button
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close,
                  size: 18.sp,
                  color: AppColors.instance.orange),
            ),
          ),

          SizedBox(height: 4.h),

          // Diamond icon
          Text('💎', style: TextStyle(fontSize: 40.sp)),

          SizedBox(height: 10.h),

          // Title
          Text(
            AppStrings.earnGemsTitle,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              color: AppColors.instance.titleTextColor,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 14.h),

          // Instructions
          DialogInstruction(
            icon: Icons.chat_bubble_outline,
            text: AppStrings.earnGemsDesc,
          ),
          SizedBox(height: 8.h),
          DialogInstruction(
            icon: Icons.mic_none,
            text: AppStrings.holdMicInstruction,
          ),
          SizedBox(height: 8.h),
          DialogInstruction(
            icon: Icons.shopping_bag_outlined,
            text: AppStrings.useGemsInstruction,
          ),

          SizedBox(height: 18.h),

          // Got it button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.instance.loginBtnColor,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                elevation: 0,
              ),
              child: Text(
                AppStrings.gotIt,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogInstruction extends StatelessWidget {
  final IconData icon;
  final String text;

  const DialogInstruction({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon,
            size: 16.sp, color: AppColors.instance.titleTextColor),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.instance.titleTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

class ChatAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.instance.loginBtnColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: AppColors.instance.orange,
            child: Text('🤖', style: TextStyle(fontSize: 14.sp)),
          ),
          SizedBox(width: 10.w),
          Text(
            AppStrings.chatbot,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 6.w),
          Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: AppColors.instance.start,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SHARED: CHAT BUBBLES ─────────────────────────────────────────────────────

class BotBubble extends StatelessWidget {
  final String text;
  const BotBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.65.sw),
        padding: EdgeInsets.symmetric(
            horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
            bottomRight: Radius.circular(14.r),
            bottomLeft: Radius.circular(4.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.instance.titleTextColor,
          ),
        ),
      ),
    );
  }
}

class UserVoiceBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.65.sw),
        padding: EdgeInsets.symmetric(
            horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.instance.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
            bottomLeft: Radius.circular(14.r),
            bottomRight: Radius.circular(4.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Waveform lines
            Row(
              children: List.generate(
                10,
                    (i) => Container(
                  width: 3.w,
                  height: (i % 3 == 0
                      ? 18.h
                      : i % 2 == 0
                      ? 12.h
                      : 8.h),
                  margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.mic, color: Colors.white, size: 16.sp),
          ],
        ),
      ),
    );
  }
}

class UserTextBubble extends StatelessWidget {
  final String text;
  const UserTextBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.7.sw),
        padding: EdgeInsets.symmetric(
            horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.instance.green100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
            bottomRight: Radius.circular(14.r),
            bottomLeft: Radius.circular(4.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.instance.titleTextColor,
          ),
        ),
      ),
    );
  }
}

// ─── SHARED: HOLD TO SPEAK BAR ────────────────────────────────────────────────

class HoldToSpeakBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      color: AppColors.instance.background,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: AppColors.instance.loginBtnColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color:
                    AppColors.instance.loginBtnColor.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(Icons.mic,
                  color: Colors.white, size: 28.sp),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            AppStrings.holdToSpeak,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.instance.subTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SHARED: USER AVATAR ──────────────────────────────────────────────────────

class UserAvatar extends StatelessWidget {
  final String label;
  const UserAvatar({required this.label});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.r,
      backgroundColor: AppColors.instance.dark400,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ─── SHARED: TOP STATS BAR ────────────────────────────────────────────────────

class QuizTopStatsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.instance.orange,
      padding:
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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

