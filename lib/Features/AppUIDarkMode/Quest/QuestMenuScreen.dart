

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Quest/LessonQuestsScreen.dart';

import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../Home/HomeWidget.dart';
import 'AutoTrackedQuestsScreen.dart';
import 'QuestWidget.dart' hide TopStatsBar, BottomNavBar;

class QuestMenuScreen extends StatelessWidget {
  const QuestMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    // Lesson Quests Button
                    QuestMenuButton(
                      label: AppStrings.lessonQuests,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LessonQuestsScreen()));
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Auto-Tracked Quests Button
                    QuestMenuButton(
                      label: AppStrings.autoTrackedQuests,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AutoTrackedQuestsScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            MainBottomNavBar(),
          ],
        ),
      ),
    );
  }
}