import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppText/app_text.dart';
import 'package:naculis/Features/AppUILightMode/Splash/splash_widget.dart';

import '../SingInSingUp/Singin_Page.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8930A),
      body: Stack(
        children: [
          // City illustration placeholder
          Positioned.fill(
            child: Image.asset(
              'assets/images/city_illustration.png',
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent overlay for bottom content readability
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 320.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xFFE8930A).withOpacity(0.85),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 140.h),

                // NACULIS title
                Text(
                  AppStrings.NACULIS,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 52.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: 12.h),

                // Subtitle
                Text(
                  AppStrings.ChooseLanguage,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 2.h),

                Text(
                  AppStrings.Eligetuidioma,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),

                const Spacer(),

                // Language buttons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      LanguageButton(
                        title: AppStrings.USEnglish,
                        subtitle: AppStrings.Welcome,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                        },
                      ),
                      SizedBox(height: 12.h),
                      LanguageButton(
                        title: AppStrings.Espanol,
                        subtitle: AppStrings.Naculis,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                        },
                      ),
                      SizedBox(height: 48.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}