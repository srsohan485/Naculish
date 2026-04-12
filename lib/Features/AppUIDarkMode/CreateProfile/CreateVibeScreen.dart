

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import 'CreateProfileWidget.dart';
import 'ProfileFeelingScreen.dart';

class CreateProfileVibeScreen extends StatelessWidget {
  const CreateProfileVibeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vibes = [
      {'emoji': '💬', 'label': AppStrings.EverydaySpeech, 'selected': false},
      {'emoji': '🏘️', 'label': AppStrings.Neighborhood, 'selected': false},
      {'emoji': '✏️', 'label': AppStrings.YouthGen, 'selected': true},
      {'emoji': '💼', 'label': AppStrings.Workplace, 'selected': false},
      {'emoji': '🎵', 'label': AppStrings.MusicCulture, 'selected': false},
      {'emoji': '👨‍👩‍👧', 'label': AppStrings.FamilyHome, 'selected': false},
      {'emoji': '💕', 'label': AppStrings.DatingFlirting, 'selected': false},
    ];

    return Scaffold(
      backgroundColor: AppColors.instance.box,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(progress: 0.66),
            SizedBox(height: 10.h),
            MascotBubble(text: AppStrings.YourVibe),
            SubText(text: AppStrings.ChooseSlang),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: vibes.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final item = vibes[index];
                  return VibeTile(
                    emoji: item['emoji'] as String,
                    label: item['label'] as String,
                    isSelected: item['selected'] as bool,
                  );
                },
              ),
            ),
            BottomButton(
              label: AppStrings.continu,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateProfileFeelingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}