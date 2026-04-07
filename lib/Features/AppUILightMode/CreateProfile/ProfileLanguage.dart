

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import 'CreateProfileWidget.dart';

class CreateProfileLanguageScreen extends StatelessWidget {
  const CreateProfileLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      {'flag': '🇺🇸', 'label': AppStrings.USEnglish, 'selected': true},
      {'flag': '🇲🇽', 'label': AppStrings.Spanish, 'selected': false},
      {'flag': '🇪🇸', 'label': AppStrings.SpanishLanguage, 'selected': false},
      {'flag': '🌐', 'label': AppStrings.SelectLanguage, 'selected': false},
    ];

    return Scaffold(
      backgroundColor: AppColors.instance.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(progress: 0.33),
            SizedBox(height: 10.h),
            MascotBubble(text: AppStrings.SpeakLanguage),
            SubText(text: AppStrings.HelpsText),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: languages.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final item = languages[index];
                  final isSelected = item['selected'] as bool;
                  return LanguageOptionTile(
                    flag: item['flag'] as String,
                    label: item['label'] as String,
                    isSelected: isSelected,
                  );
                },
              ),
            ),
            BottomButton(label: AppStrings.start),
          ],
        ),
      ),
    );
  }
}