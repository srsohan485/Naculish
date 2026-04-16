import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/Theme/app_theme_colors.dart';

// ── App Bar ───────────────────────────────────────────────────────────────────
class AppBar extends StatelessWidget {
  final String title;
  const AppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      color: colors.card, // ✅
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8.h,
        left: 16.w,
        right: 16.w,
        bottom: 12.h,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Icon(Icons.chevron_left, size: 28.sp, color: colors.normalText), // ✅
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: colors.normalText, // ✅
            ),
          ),
        ],
      ),
    );
  }
}

// ── Input Field ───────────────────────────────────────────────────────────────
class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;

  const InputField({
    required this.controller,
    required this.hintText,
    required this.maxLines,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 13.sp, color: colors.normalText), // ✅
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: colors.hintText, fontSize: 13.sp), // ✅
        filled: true,
        fillColor: colors.inputFill, // ✅
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.accentOrange, width: 1.5), // ✅
        ),
      ),
    );
  }
}

// ── Primary Button ────────────────────────────────────────────────────────────
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const PrimaryButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primaryBtn, // ✅
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}