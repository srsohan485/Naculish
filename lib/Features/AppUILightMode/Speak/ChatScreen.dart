import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Speak/SpeakWidget.dart';

import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: SafeArea(
        child: Column(
          children: [
            QuizTopStatsBar(),
            ChatAppBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                children: [
                  BotBubble(text: AppStrings.chatGreeting),
                  SizedBox(height: 16.h),
                  Center(
                    child: Text(
                      AppStrings.chatTime,
                      style: TextStyle(fontSize: 11.sp, color: colors.subText), // ✅
                    ),
                  ),
                  SizedBox(height: 12.h),
                  UserVoiceBubble(),
                  SizedBox(height: 10.h),
                  BotBubble(text: AppStrings.chatGreeting),
                  SizedBox(height: 6.h),
                  BotBubble(text: AppStrings.chatGreeting),
                  SizedBox(height: 10.h),
                  UserVoiceBubble(),
                  SizedBox(height: 6.h),
                  UserVoiceBubble(),
                  SizedBox(height: 10.h),
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