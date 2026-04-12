


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Features/AppUILightMode/Profile/EditProfileScreen.dart';
import 'package:naculis/Features/AppUILightMode/Profile/ProfileDetailScreen.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../ContactWidget/ContactUsPage.dart';
import '../MyBalance/BalancePage.dart';
import '../Notifications/NotificationPage.dart';
import 'ProfileWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            ProfileAppBar(title: AppStrings.profile, showEdit: false),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),

                    // Avatar + Name + Email
                    ProfileAvatarSection(
                      name: AppStrings.userName,
                      email: AppStrings.email,
                      showEditIcon: false,
                    ),

                    SizedBox(height: 16.h),

                    // AI Personality Card
                    AiPersonalityCard(),

                    SizedBox(height: 14.h),

                    // Friends + Your Stats row
                    Row(
                      children: [
                        Expanded(child: FriendsCard()),
                        SizedBox(width: 12.w),
                        Expanded(child: YourStatsCard()),
                      ],
                    ),

                    SizedBox(height: 14.h),

                    // Menu sections
                    SectionLabel(label: AppStrings.accountDetails),
                    MenuTile(
                      icon: Icons.person_outline,
                      label: AppStrings.personalInfo,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ProfileDetailScreen()),
                        );
                      },
                    ),
                    MenuTile(
                      icon: Icons.notifications_none,
                      label: AppStrings.notification,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => NotificationPage()),
                        );
                      },
                    ),
                    MenuTile(
                      icon: Icons.people_outline,
                      label: AppStrings.referFriend,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ContactUsPage()),
                        );
                      },
                    ),

                    SizedBox(height: 6.h),
                    SectionLabel(
                        label: AppStrings.settingsAccessibility),
                    ToggleTile(label: AppStrings.darkMode),
                    ToggleTile(label: AppStrings.voiceOver),

                    SizedBox(height: 6.h),
                    SectionLabel(label: AppStrings.earn),
                    MenuTile(
                      icon: Icons.account_balance_wallet_outlined,
                      label: AppStrings.myBalance,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => BalancePage()),
                        );
                      },
                    ),

                    SizedBox(height: 6.h),
                    SectionLabel(label: AppStrings.support),
                    MenuTile(
                      icon: Icons.mail_outline,
                      label: AppStrings.contactUs,
                    ),
                    MenuTile(
                      icon: Icons.logout,
                      label: AppStrings.logout,
                      isRed: true,
                    ),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
            MainBottomNavBar(),
          ],
        ),
      ),
    );
  }
}