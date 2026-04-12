

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Speak/SpeakWidget.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../Home/HomeWidget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.background,
      body: SafeArea(
        child: Column(
          children: [
            QuizTopStatsBar(),
            ChatAppBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 14.h),
                children: [
                  // Bot greeting bubble
                  BotBubble(text: AppStrings.chatGreeting),

                  SizedBox(height: 16.h),

                  // Timestamp center
                  Center(
                    child: Text(
                      AppStrings.chatTime,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.instance.subTextColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // User voice bubble
                  UserVoiceBubble(),
                  SizedBox(height: 10.h),

                  // Bot reply
                  BotBubble(text: AppStrings.chatGreeting),
                  SizedBox(height: 6.h),
                  BotBubble(text: AppStrings.chatGreeting),

                  SizedBox(height: 10.h),

                  // User voice bubble
                  UserVoiceBubble(),
                  SizedBox(height: 6.h),
                  UserVoiceBubble(),

                  SizedBox(height: 10.h),

                  // User text bubble
                  UserTextBubble(text: AppStrings.userMessageExample),
                ],
              ),
            ),
            HoldToSpeakBar(),

          ],
        ),
      ),
    );
  }
}