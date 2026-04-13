// ─── PROFILE WIDGETS ──────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Profile/AiAnalysisDialog.dart';
import 'package:naculis/Features/AppUILightMode/Profile/ProfileDetailScreen.dart';
import 'package:provider/provider.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import '../../../Core/Theme/theme_notifier.dart';
import 'EditProfileScreen.dart';

// ─── AI PERSONALITY CARD ──────────────────────────────────────────────────────

class AiPersonalityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ✅ context.appColors — theme change হলে এটা নিজে নিজে update হবে
    final colors = context.appColors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: colors.accentOrangeBox,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.psychology_outlined, color: colors.accentOrange, size: 18.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  AppStrings.aiPersonality,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: colors.titleText,
                  ),
                ),
              ),
              Icon(Icons.star_border, color: colors.star, size: 18.sp),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            AppStrings.aiDescription,
            style: TextStyle(fontSize: 11.sp, color: colors.subText),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 130.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aianalysisdialog()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primaryBtn,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                elevation: 0,
              ),
              child: Text(
                AppStrings.generateAnalysis,
                style: TextStyle(
                    fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── FRIENDS CARD ─────────────────────────────────────────────────────────────

class FriendsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colors.accentOrangeBox,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.people_outline, color: colors.accentOrange, size: 16.sp),
              SizedBox(width: 6.w),
              Text(
                AppStrings.friends,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: colors.titleText),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(AppStrings.squadText,
              style: TextStyle(fontSize: 10.sp, color: colors.subText)),
          SizedBox(height: 8.h),
          Text(AppStrings.earnReferral,
              style: TextStyle(fontSize: 9.sp, color: colors.subText)),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primaryBtn,
                padding: EdgeInsets.symmetric(vertical: 6.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                elevation: 0,
              ),
              child: Text(
                AppStrings.inviteFriends,
                style: TextStyle(
                    fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }
}

// ─── YOUR STATS CARD ──────────────────────────────────────────────────────────

class YourStatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    final stats = [
      {'icon': '💎', 'label': AppStrings.gems},
      {'icon': '❤️', 'label': AppStrings.hearts},
      {'icon': '🏆', 'label': AppStrings.Level},
      {'icon': '🔥', 'label': AppStrings.dayStreak},
      {'icon': '⚡', 'label': AppStrings.xp},
    ];

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colors.accentOrangeBox,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.yourStats,
            style: TextStyle(
                fontSize: 13.sp, fontWeight: FontWeight.w700, color: colors.titleText),
          ),
          SizedBox(height: 8.h),
          ...stats.map(
                (s) => Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Row(
                children: [
                  Text(s['icon']!, style: TextStyle(fontSize: 13.sp)),
                  SizedBox(width: 6.w),
                  Text(s['label']!,
                      style: TextStyle(fontSize: 11.sp, color: colors.titleText)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── AI ANALYSIS DIALOG ───────────────────────────────────────────────────────

class AiAnalysisDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.psychology_outlined, color: colors.accentOrange, size: 18.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  AppStrings.aiPersonality,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: colors.titleText),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                      color: colors.accentOrange, shape: BoxShape.circle),
                  child: Icon(Icons.close, color: Colors.white, size: 14.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            AppStrings.aiFullAnalysis,
            style: TextStyle(fontSize: 11.sp, color: colors.subText, height: 1.5),
          ),
          SizedBox(height: 14.h),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.accentOrange,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                elevation: 0,
              ),
              child: Text(
                AppStrings.refreshAnalysis,
                style: TextStyle(
                    fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── EDIT FIELD ───────────────────────────────────────────────────────────────

class EditField extends StatelessWidget {
  final String label;
  final String value;
  const EditField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: colors.titleText)),
        SizedBox(height: 4.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: colors.inputFill,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: colors.border),
          ),
          child: Text(value,
              style: TextStyle(fontSize: 12.sp, color: colors.normalText)),
        ),
      ],
    );
  }
}

// ─── EDIT DROPDOWN ────────────────────────────────────────────────────────────

class EditDropdown extends StatelessWidget {
  final String label;
  final String value;
  const EditDropdown({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: colors.titleText)),
        SizedBox(height: 4.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: colors.inputFill,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12.sp, color: colors.normalText)),
              Icon(Icons.keyboard_arrow_down, size: 18.sp, color: colors.subText),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── EDIT DATE FIELD ──────────────────────────────────────────────────────────

class EditDateField extends StatelessWidget {
  final String label;
  final String value;
  const EditDateField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: colors.titleText)),
        SizedBox(height: 4.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: colors.inputFill,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12.sp, color: colors.normalText)),
              Icon(Icons.calendar_today_outlined, size: 16.sp, color: colors.subText),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── PROFILE APP BAR ──────────────────────────────────────────────────────────

class ProfileAppBar extends StatelessWidget {
  final String title;
  final bool showEdit;
  const ProfileAppBar({required this.title, required this.showEdit});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, size: 18.sp, color: colors.titleText),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: colors.titleText),
              ),
            ),
          ),
          if (showEdit)
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EditProfileScreen()));
              },
              icon: Icon(Icons.edit, size: 18.sp, color: colors.titleText),
            )
          else
            SizedBox(width: 18.w),
        ],
      ),
    );
  }
}

// ─── PROFILE AVATAR SECTION ───────────────────────────────────────────────────

class ProfileAvatarSection extends StatelessWidget {
  final String name;
  final String email;
  final bool showEditIcon;
  const ProfileAvatarSection(
      {required this.name, required this.email, required this.showEditIcon});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 38.r,
              backgroundColor: colors.boxBg,
              backgroundImage: AssetImage(AppImages.Profile),
            ),
            if (showEditIcon)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                      color: colors.primaryBtn, shape: BoxShape.circle),
                  child: Icon(Icons.edit, color: Colors.white, size: 12.sp),
                ),
              ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(name,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: colors.titleText)),
        SizedBox(height: 2.h),
        Text(email,
            style: TextStyle(fontSize: 12.sp, color: colors.subText)),
      ],
    );
  }
}

// ─── MENU TILE ────────────────────────────────────────────────────────────────

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isRed;
  final VoidCallback? onTap;
  final VoidCallback? onIconTap;

  const MenuTile({
    required this.icon,
    required this.label,
    this.isRed = false,
    this.onTap,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: ListTile(
        dense: true,
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0),
        leading: IconButton(
          onPressed: onIconTap,
          icon: Icon(
            icon,
            size: 20.sp,
            color: isRed ? colors.error : colors.titleText,
          ),
        ),
        title: Text(
          label,
          style: TextStyle(
              fontSize: 13.sp,
              color: isRed ? colors.error : colors.titleText),
        ),
        trailing: isRed
            ? null
            : Icon(Icons.arrow_forward_ios, size: 14.sp, color: colors.subText),
      ),
    );
  }
}

// ─── TOGGLE TILE ──────────────────────────────────────────────────────────────

class ToggleTile extends StatelessWidget {
  final String label;
  const ToggleTile({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<ThemeNotifier>();
    final colors = context.appColors;

    final bool switchValue =
    label == AppStrings.darkMode ? notifier.isDark : false;

    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0),
      leading: Icon(
        label == AppStrings.darkMode
            ? Icons.dark_mode_outlined
            : Icons.record_voice_over_outlined,
        size: 20.sp,
        color: colors.titleText,
      ),
      title: Text(label,
          style: TextStyle(fontSize: 13.sp, color: colors.titleText)),
      trailing: Switch(
        value: switchValue,
        onChanged: (val) {
          if (label == AppStrings.darkMode) {
            notifier.toggle();
          }
        },
        activeColor: colors.primaryBtn,
        activeTrackColor: colors.accentOrangeBox,
        inactiveThumbColor: colors.stroke,
        inactiveTrackColor: colors.border,
      ),
    );
  }
}

// ─── SECTION LABEL ────────────────────────────────────────────────────────────

class SectionLabel extends StatelessWidget {
  final String label;
  const SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 4.h, left: 4.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colors.subText)),
      ),
    );
  }
}

// ─── INFO TILE ────────────────────────────────────────────────────────────────

class InfoTile extends StatelessWidget {
  final String label;
  final String value;
  const InfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.inputFill,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: colors.border),
      ),
      child: Text(
        '$label : $value',
        style: TextStyle(fontSize: 13.sp, color: colors.titleText),
      ),
    );
  }
}

// ─── BOTTOM NAV BAR ───────────────────────────────────────────────────────────

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ✅ bottomNavBackground theme থেকে নেওয়া হচ্ছে
    final colors = context.appColors;

    final List<String> navIcons = [
      AppImages.Icon1,
      AppImages.Icon2,
      AppImages.Icon3,
      AppImages.Icon4,
      AppImages.Icon5,
      AppImages.Icon6,
    ];

    return Container(
      width: double.infinity,
      color: colors.bottomNavBackground,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navIcons
            .map(
              (icon) => GestureDetector(
            onTap: () {},
            child: Image.asset(icon, width: 26.w, height: 26.h),
          ),
        )
            .toList(),
      ),
    );
  }
}