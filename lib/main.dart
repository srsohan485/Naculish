import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Features/AppUILightMode/Auth/View/forgot_password.dart';
import 'Features/AppUILightMode/CreateProfile/ProfileLanguage.dart';
import 'Features/AppUILightMode/Home/HomeMapScreen.dart';
import 'Features/AppUILightMode/Leaderboard/LeaderboardScreen.dart';
import 'Features/AppUILightMode/Profile/ProfileScreen.dart';
import 'Features/AppUILightMode/Quest/QuestMenuScreen.dart';
import 'Features/AppUILightMode/Shop/ShopScreen.dart';
import 'Features/AppUILightMode/Shop/ShopWidget.dart';
import 'Features/AppUILightMode/Shop/WithdhrawPayPal.dart';
import 'Features/AppUILightMode/SingInSingUp/Singin_Page.dart';
import 'Features/AppUILightMode/Speak/SpeakScreen.dart';
import 'Features/AppUILightMode/Splash/splash_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // ✅ builder ensures ScreenUtil is ready before ANY child widget builds
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          home: child,
        );
      },
      // ✅ Pass the first screen as child — NOT inside MaterialApp directly
      child: const ProfileScreen(),
    );
  }
}