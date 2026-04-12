


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/AppText/app_text.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../Home/HomeWidget.dart';
import 'ProfileWidget.dart' hide BottomNavBar;

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5DEB3),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                ProfileAppBar(
                    title: AppStrings.profile, showEdit: true),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        ProfileAvatarSection(
                          name: AppStrings.userName,
                          email: AppStrings.email,
                          showEditIcon: false,
                        ),
                        SizedBox(height: 20.h),
                        InfoTile(
                            label: AppStrings.phone,
                            value: '+44 234 563 45'),
                        SizedBox(height: 10.h),
                        InfoTile(
                            label: AppStrings.birthday,
                            value: '12/05/1996'),
                        SizedBox(height: 10.h),
                        InfoTile(
                            label: AppStrings.country,
                            value: 'United Kingdom'),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}