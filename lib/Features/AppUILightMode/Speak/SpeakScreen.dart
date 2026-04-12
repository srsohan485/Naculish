

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Speak/SpeakWidget.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../Home/HomeWidget.dart';

class SpeakScreen extends StatelessWidget {
  const SpeakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.appBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // Main chat layout behind dialog
            Column(
              children: [
                QuizTopStatsBar(),
                ChatAppBar(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 12.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: BotBubble(text: AppStrings.chatGreeting),
                    ),
                  ),
                ),
                // Avatar bottom right
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.w, bottom: 8.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: UserAvatar(label: 'K'),
                  ),
                ),
                HoldToSpeakBar(),

              ],
            ),

            // Dark overlay
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.45),
              ),
            ),

            // Earn Gems dialog centered
            Center(
              child: EarnGemsDialog(),
            ),
          ],
        ),
      ),
    );
  }
}