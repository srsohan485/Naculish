import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppImages/app_images.dart';

import '../../../Core/AppText/app_text.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'ProfileWidget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ hardcode সরানো
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          children: [
            ProfileAppBar(title: AppStrings.editProfile, showEdit: false),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 38.r,
                            // ✅ AppColors.instance সরানো → context.appColors
                            backgroundColor: colors.boxBg,
                            backgroundImage: AssetImage(AppImages.Profile),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 22.w,
                              height: 22.h,
                              decoration: BoxDecoration(
                                color: colors.primaryBtn,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.edit, color: Colors.white, size: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Center(
                      child: Text(
                        AppStrings.userName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: colors.titleText,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        AppStrings.email,
                        style: TextStyle(fontSize: 11.sp, color: colors.subText),
                      ),
                    ),

                    SizedBox(height: 18.h),

                    Row(
                      children: [
                        Expanded(
                          child: EditField(
                            label: AppStrings.firstName,
                            value: AppStrings.firstNameValue,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: EditField(
                            label: AppStrings.lastName,
                            value: AppStrings.lastNameValue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    EditField(label: AppStrings.EmailAddress, value: AppStrings.email),
                    SizedBox(height: 12.h),
                    EditField(label: AppStrings.Phone, value: '+44 234 563 45'),
                    SizedBox(height: 12.h),
                    EditDropdown(label: AppStrings.gender, value: AppStrings.female),
                    SizedBox(height: 12.h),
                    EditDateField(label: 'Birthday', value: '12/05/1996'),
                    SizedBox(height: 12.h),
                    EditDropdown(label: AppStrings.country, value: 'UK'),
                    SizedBox(height: 24.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primaryBtn,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          AppStrings.Save,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}