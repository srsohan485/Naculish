import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Features/AppUILightMode/Home/HomeWidget.dart';
import '../Theme/app_theme_colors.dart';
class MainTopStatsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      width: double.infinity,
      color: colors.accentOrange, // ✅
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatItem(icon: Icons.star, value: '5', color: Colors.white),
          StatItem(icon: Icons.favorite, value: '5', color: Colors.white),
          StatItem(icon: Icons.bolt, value: '300', color: Colors.white),
        ],
      ),
    );
  }
}