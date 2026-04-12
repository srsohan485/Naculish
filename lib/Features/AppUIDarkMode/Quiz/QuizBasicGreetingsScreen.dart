
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Quiz/QuizWidget.dart';

import '../../../Core/AppText/app_text.dart';

class QuizBasicGreetingsScreen extends StatelessWidget {
  const QuizBasicGreetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Column(
          children: [
            QuizTopStatsBar(),
            QuizHeader(
              title: AppStrings.basicGreetings,
              subtitle: AppStrings.vocabularyLesson,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: QuizCard(questionNumber: 1),
              ),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}