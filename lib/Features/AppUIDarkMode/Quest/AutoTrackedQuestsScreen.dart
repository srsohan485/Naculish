

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Quest/QuestWidget.dart';

import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';

class AutoTrackedQuestsScreen extends StatelessWidget {
  const AutoTrackedQuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            QuestHeader(title: AppStrings.autoTrackedQuests),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                children: [
                  QuestCard(
                    badge: AppStrings.basic,
                    reward: AppStrings.getReward60,
                    title: AppStrings.masterBasicGreetings,
                    task: AppStrings.questTask,
                    progress: AppStrings.progress,
                    progressValue: 0.0,
                    percent: AppStrings.percentZero,
                  ),
                  SizedBox(height: 14.h),
                  QuestCard(
                    badge: AppStrings.basic,
                    reward: AppStrings.getReward80,
                    title: AppStrings.survivalSlang,
                    task: AppStrings.questTask,
                    progress: AppStrings.progressFive,
                    progressValue: 0.0,
                    percent: AppStrings.percentZero,
                  ),
                ],
              ),
            ),
            MainBottomNavBar(),
          ],
        ),
      ),
    );
  }
}