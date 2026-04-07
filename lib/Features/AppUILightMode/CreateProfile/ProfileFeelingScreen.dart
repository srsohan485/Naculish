

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import 'CreateProfileWidget.dart';

class CreateProfileFeelingScreen extends StatelessWidget {
  const CreateProfileFeelingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moods = [
      {'emoji': '😌', 'label': AppStrings.ChillContent, 'selected': false},
      {'emoji': '🤩', 'label': AppStrings.CuriousReadyLearn, 'selected': false},
      {'emoji': '😐', 'label': AppStrings.NeutralMeh, 'selected': false},
      {'emoji': '😵', 'label': AppStrings.Overwhelmedout, 'selected': false},
      {'emoji': '😤', 'label': AppStrings.Frustrated, 'selected': true},
      {'emoji': '🤪', 'label': AppStrings.Silly, 'selected': false},
    ];

    return Scaffold(
      backgroundColor: AppColors.instance.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(progress: 1.0),
            SizedBox(height: 10.h),
            MascotBubble(text: AppStrings.FeelingToday),
            SubText(text: AppStrings.Matchyourvibe),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: moods.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final item = moods[index];
                  return MoodTile(
                    emoji: item['emoji'] as String,
                    label: item['label'] as String,
                    isSelected: item['selected'] as bool,
                  );
                },
              ),
            ),
            BottomButton(label: AppStrings.continu),
          ],
        ),
      ),
    );
  }
}