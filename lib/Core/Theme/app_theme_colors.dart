// lib/Core/Theme/app_theme_colors.dart

import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color background;
  final Color card;
  final Color cardBackground;
  final Color appBarBackground;
  final Color bottomNavBackground;
  final Color titleText;
  final Color normalText;
  final Color subText;
  final Color hintText;
  final Color primaryBtn;       // green button
  final Color primaryBtnText;
  final Color accentOrange;     // orange accent #F49000
  final Color accentOrangeBox;  // box bg
  final Color boxBg;
  final Color border;
  final Color stroke;
  final Color success;
  final Color error;
  final Color star;
  final Color inputFill;

  const AppThemeColors({
    required this.background,
    required this.card,
    required this.cardBackground,
    required this.appBarBackground,
    required this.bottomNavBackground,
    required this.titleText,
    required this.normalText,
    required this.subText,
    required this.hintText,
    required this.primaryBtn,
    required this.primaryBtnText,
    required this.accentOrange,
    required this.accentOrangeBox,
    required this.boxBg,
    required this.border,
    required this.stroke,
    required this.success,
    required this.error,
    required this.star,
    required this.inputFill,
  });

  // ✅ Light Theme Colors — Figma light screens থেকে
  static const light = AppThemeColors(
    background: Color(0xFFF5F5F5),        // হালকা off-white page background
    card: Color(0xFFFFFFFF),              // সাদা card
    cardBackground: Color(0xFFFFFFFF),    // সাদা card background
    appBarBackground: Color(0xFFF49000),  // orange AppBar (Figma থেকে)
    bottomNavBackground: Color(0xFFF49000), // orange bottom nav
    titleText: Color(0xFF1A1A1A),          // AppBar title সাদা (orange bg এ)
    normalText: Color(0xFF1A1A1A),        // body text কালো
    subText: Color(0xFF757575),           // secondary text ধূসর
    hintText: Color(0xFFAAAAAA),          // input hint ধূসর
    primaryBtn: Color(0xFF4CAF50),        // সবুজ button
    primaryBtnText: Color(0xFFFFFFFF),
    accentOrange: Color(0xFFF49000),      // orange accent
    accentOrangeBox: Color(0xFFFFF3E0),   // হালকা orange box bg
    boxBg: Color(0xFFEBF4FF),            // হালকা নীল box bg
    border: Color(0xFFE0E0E0),           // হালকা border
    stroke: Color(0xFFBDBDBD),
    success: Color(0xFF4CAF50),
    error: Color(0xFFFF0000),
    star: Color(0xFFFFD100),
    inputFill: Color(0xFFFFFFFF),        // input background সাদা
  );

  // ✅ Dark Theme Colors — Figma dark screens থেকে
  static const dark = AppThemeColors(
    background: Color(0xFF1E1E1E),        // dark charcoal background
    card: Color(0xFF2C2C2C),             // card — background এর চেয়ে হালকা
    cardBackground: Color(0xFF2C2C2C),
    appBarBackground: Color(0xFF1A1A1A), // dark AppBar
    bottomNavBackground: Color(0xFFF49000), // orange (একই থাকে)
    titleText: Color(0xFFFFFFFF),         // সাদা title
    normalText: Color(0xFFEEEEEE),        // হালকা সাদা body text
    subText: Color(0xFFAAAAAA),           // muted grey
    hintText: Color(0xFF757575),
    primaryBtn: Color(0xFF4CAF50),        // সবুজ button (একই)
    primaryBtnText: Color(0xFFFFFFFF),
    accentOrange: Color(0xFFF49000),      // orange accent (একই)
    accentOrangeBox: Color(0xFF3D2800),   // dark orange box bg
    boxBg: Color(0xFF252525),
    border: Color(0xFF3A3A3A),
    stroke: Color(0xFF4A4A4A),
    success: Color(0xFF4CAF50),
    error: Color(0xFFFF4444),
    star: Color(0xFFFFD100),
    inputFill: Color(0xFF2C2C2C),        // dark input fill
  );

  @override
  AppThemeColors copyWith({
    Color? background, Color? card, Color? cardBackground,
    Color? appBarBackground, Color? bottomNavBackground,
    Color? titleText, Color? normalText, Color? subText,
    Color? hintText, Color? primaryBtn, Color? primaryBtnText,
    Color? accentOrange, Color? accentOrangeBox, Color? boxBg,
    Color? border, Color? stroke, Color? success, Color? error,
    Color? star, Color? inputFill,
  }) {
    return AppThemeColors(
      background: background ?? this.background,
      card: card ?? this.card,
      cardBackground: cardBackground ?? this.cardBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      bottomNavBackground: bottomNavBackground ?? this.bottomNavBackground,
      titleText: titleText ?? this.titleText,
      normalText: normalText ?? this.normalText,
      subText: subText ?? this.subText,
      hintText: hintText ?? this.hintText,
      primaryBtn: primaryBtn ?? this.primaryBtn,
      primaryBtnText: primaryBtnText ?? this.primaryBtnText,
      accentOrange: accentOrange ?? this.accentOrange,
      accentOrangeBox: accentOrangeBox ?? this.accentOrangeBox,
      boxBg: boxBg ?? this.boxBg,
      border: border ?? this.border,
      stroke: stroke ?? this.stroke,
      success: success ?? this.success,
      error: error ?? this.error,
      star: star ?? this.star,
      inputFill: inputFill ?? this.inputFill,
    );
  }

  @override
  AppThemeColors lerp(AppThemeColors? other, double t) {
    if (other == null) return this;

    return AppThemeColors(
      background: Color.lerp(background, other.background, t) ?? background,
      card: Color.lerp(card, other.card, t) ?? card,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t) ?? cardBackground,
      appBarBackground: Color.lerp(appBarBackground, other.appBarBackground, t) ?? appBarBackground,
      bottomNavBackground: Color.lerp(bottomNavBackground, other.bottomNavBackground, t) ?? bottomNavBackground,
      titleText: Color.lerp(titleText, other.titleText, t) ?? titleText,
      normalText: Color.lerp(normalText, other.normalText, t) ?? normalText,
      subText: Color.lerp(subText, other.subText, t) ?? subText,
      hintText: Color.lerp(hintText, other.hintText, t) ?? hintText,
      primaryBtn: Color.lerp(primaryBtn, other.primaryBtn, t) ?? primaryBtn,
      primaryBtnText: Color.lerp(primaryBtnText, other.primaryBtnText, t) ?? primaryBtnText,
      accentOrange: Color.lerp(accentOrange, other.accentOrange, t) ?? accentOrange,
      accentOrangeBox: Color.lerp(accentOrangeBox, other.accentOrangeBox, t) ?? accentOrangeBox,
      boxBg: Color.lerp(boxBg, other.boxBg, t) ?? boxBg,
      border: Color.lerp(border, other.border, t) ?? border,
      stroke: Color.lerp(stroke, other.stroke, t) ?? stroke,
      success: Color.lerp(success, other.success, t) ?? success,
      error: Color.lerp(error, other.error, t) ?? error,
      star: Color.lerp(star, other.star, t) ?? star,
      inputFill: Color.lerp(inputFill, other.inputFill, t) ?? inputFill,
    );
  }
}

// ✅ Easy access extension — context.appColors লিখলেই হবে
extension AppThemeColorsExtension on BuildContext {
  AppThemeColors get appColors =>
      Theme.of(this).extension<AppThemeColors>()!;
}