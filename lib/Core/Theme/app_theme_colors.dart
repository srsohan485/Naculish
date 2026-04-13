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
  final Color accentOrange;     // orange accent #FE7400
  final Color accentOrangeBox;  // box bg #FFECCB
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
    background: Color(0xFFF5DEB3),        // cream/wheat bg
    card: Color(0xFFFFFFFF),
    cardBackground: Color(0xFFF5F5F5),
    appBarBackground: Color(0xFFFFFFFF),
    bottomNavBackground: Color(0xFFF49000),  // orange bottom nav
    titleText: Color(0xFF00193F),
    normalText: Color(0xFF0F172A),
    subText: Color(0xFF757575),
    hintText: Color(0xFF818181),
    primaryBtn: Color(0xFF12B76A),           // green button
    primaryBtnText: Color(0xFFFFFFFF),
    accentOrange: Color(0xFFFE7400),
    accentOrangeBox: Color(0xFFFFECCB),
    boxBg: Color(0xFFEBF4FF),
    border: Color(0xFFDBDBDB),
    stroke: Color(0xFF939393),
    success: Color(0xFF11D279),
    error: Color(0xFFFF0000),
    star: Color(0xFFFFD100),
    inputFill: Color(0xFFFFFFFF),
  );

  // ✅ Dark Theme Colors — Figma dark screens থেকে
  static const dark = AppThemeColors(
    background: Color(0xFF2D2D2D),          // dark bg
    card: Color(0xFF1A1A1A),
    cardBackground: Color(0xFF222222),
    appBarBackground: Color(0xFF1A1A1A),
    bottomNavBackground: Color(0xFFF49000),  // orange (same)
    titleText: Color(0xFFFFFFFF),
    normalText: Color(0xFFEEEEEE),
    subText: Color(0xFFB0B0B0),
    hintText: Color(0xFF818181),
    primaryBtn: Color(0xFF12B76A),
    primaryBtnText: Color(0xFFFFFFFF),
    accentOrange: Color(0xFFFE7400),
    accentOrangeBox: Color(0xFF3D2800),
    boxBg: Color(0xFF1F1F1F),
    border: Color(0xFF444444),
    stroke: Color(0xFF555555),
    success: Color(0xFF11D279),
    error: Color(0xFFFF4444),
    star: Color(0xFFFFD100),
    inputFill: Color(0xFF333333),
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
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      background: Color.lerp(background, other.background, t)!,
      card: Color.lerp(card, other.card, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      appBarBackground: Color.lerp(appBarBackground, other.appBarBackground, t)!,
      bottomNavBackground: Color.lerp(bottomNavBackground, other.bottomNavBackground, t)!,
      titleText: Color.lerp(titleText, other.titleText, t)!,
      normalText: Color.lerp(normalText, other.normalText, t)!,
      subText: Color.lerp(subText, other.subText, t)!,
      hintText: Color.lerp(hintText, other.hintText, t)!,
      primaryBtn: Color.lerp(primaryBtn, other.primaryBtn, t)!,
      primaryBtnText: Color.lerp(primaryBtnText, other.primaryBtnText, t)!,
      accentOrange: Color.lerp(accentOrange, other.accentOrange, t)!,
      accentOrangeBox: Color.lerp(accentOrangeBox, other.accentOrangeBox, t)!,
      boxBg: Color.lerp(boxBg, other.boxBg, t)!,
      border: Color.lerp(border, other.border, t)!,
      stroke: Color.lerp(stroke, other.stroke, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      star: Color.lerp(star, other.star, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
    );
  }
}

// ✅ Easy access extension — context.appColors লিখলেই হবে
extension AppThemeColorsExtension on BuildContext {
  AppThemeColors get appColors =>
      Theme.of(this).extension<AppThemeColors>()!;
}