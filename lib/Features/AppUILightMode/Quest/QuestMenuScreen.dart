import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Quest/LessonQuestsScreen.dart';

import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'AutoTrackedQuestsScreen.dart';
import 'QuestWidget.dart' hide BottomNavBar;

class QuestMenuScreen extends StatelessWidget {
  const QuestMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: SafeArea(
        child: Column(
          children: [
            TopStatsBar(),
            Expanded(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  children: [
                    QuestMenuButton(
                      label: AppStrings.lessonQuests,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => LessonQuestsScreen()),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    QuestMenuButton(
                      label: AppStrings.autoTrackedQuests,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AutoTrackedQuestsScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}