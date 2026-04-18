import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppBar/TopStatsBar.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'LeaderBoardWidget.dart' hide BottomNavBar;

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  static const List<Map<String, String>> _players = [
    {'position': '01', 'name': AppStrings.playerName, 'score': AppStrings.score},
    {'position': '02', 'name': AppStrings.playerName, 'score': AppStrings.score},
    {'position': '03', 'name': AppStrings.playerName, 'score': AppStrings.score},
    {'position': '04', 'name': AppStrings.playerName, 'score': AppStrings.score},
    {'position': '05', 'name': AppStrings.playerName, 'score': AppStrings.score},
    {'position': '06', 'name': AppStrings.playerName, 'score': AppStrings.score},
    {'position': '07', 'name': AppStrings.playerName, 'score': AppStrings.score},
    {'position': '08', 'name': AppStrings.playerName, 'score': AppStrings.score},
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: SafeArea(
        child: Column(
          children: [
            MainTopStatsBar(),
            LeaderboardHeader(),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                itemCount: _players.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final player = _players[index];
                  return LeaderboardTile(
                    position: player['position']!,
                    name: player['name']!,
                    score: player['score']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}