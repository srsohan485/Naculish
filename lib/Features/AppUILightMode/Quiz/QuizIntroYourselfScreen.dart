import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Quiz/QuizWidget.dart';

import '../../../Core/AppBar/TopStatsBar.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';

class QuizIntroYourselfScreen extends StatelessWidget {
  const QuizIntroYourselfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.background, // ✅
      body: SafeArea(
        child: Column(
          children: [
            MainTopStatsBar(),
            QuizHeader(
              title: AppStrings.introYourself,
              subtitle: AppStrings.vocabularyLesson,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: QuizCard(questionNumber: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}