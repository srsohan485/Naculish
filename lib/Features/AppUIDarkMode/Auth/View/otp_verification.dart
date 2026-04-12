
// ─── SCREEN 2: OTP Verification ──────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppColor/app_color.dart';
import '../../../../Core/AppText/app_text.dart';
import 'auth_widget.dart';
import 'new_password.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

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
                  AppStrings.OTPVerification,
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
              SizedBox(height: 8.h),

              // Enter Code label
              Center(
                child: Text(
                  AppStrings.EnterCode,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: colors.white50,
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // OTP boxes
              Center(child: OTPRow()),
              SizedBox(height: 36.h),

              // Next button
              PrimaryButton(
                label: AppStrings.next,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const NewPasswordScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}