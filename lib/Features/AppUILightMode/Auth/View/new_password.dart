
// ─── SCREEN 3: New Password ───────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppColor/app_color.dart';
import '../../../../Core/AppText/app_text.dart';
import '../../Splash/splash_screen1.dart';
import 'auth_widget.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;

    return Scaffold(
      backgroundColor: colors.bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios,
                    color: colors.white50, size: 20.sp),
              ),
              SizedBox(height: 32.h),

              // Title
              Center(
                child: Text(
                  AppStrings.NewPassword,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: colors.white50,
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              // Subtitle
              Center(
                child: Text(
                  AppStrings.SelectProceed,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: colors.white50.withOpacity(0.85),
                  ),
                ),
              ),
              SizedBox(height: 36.h),

              // New Password label
              Text(
                AppStrings.NewPassword,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.white50,
                ),
              ),
              SizedBox(height: 8.h),
              AuthTextField(
                hint: '••• ••• •••',
                obscureText: true,
              ),
              SizedBox(height: 20.h),

              // Confirm Password label
              Text(
                AppStrings.ConfirmPassword,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.white50,
                ),
              ),
              SizedBox(height: 8.h),
              AuthTextField(
                hint: '••• ••• •••',
                obscureText: true,
              ),
              SizedBox(height: 32.h),

              // Save button
              PrimaryButton(
                label: AppStrings.save,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}