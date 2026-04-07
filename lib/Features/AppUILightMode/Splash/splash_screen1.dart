import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppText/app_text.dart';
import 'package:naculis/Features/AppUILightMode/Splash/splash_screen2.dart';

// ──────────────────────────────────────────────
// Screen 1 – Loading Splash (0%)
// ──────────────────────────────────────────────
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LanguageSelectionScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // City illustration placeholder
          Positioned.fill(
            child: Image.asset(
              'assets/images/city_illustration.png',
              fit: BoxFit.cover,
            ),
          ),

          // NACULIS title
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                AppStrings.NACULIS,
                style: TextStyle(
                  fontFamily: AppStrings.popular,
                  fontSize: 52.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),

          // Progress ring
          Positioned(
            bottom: 260.h,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, _) {
                  final percent =
                  (_progressAnimation.value * 100).toInt();
                  return SizedBox(
                    width: 72.w,
                    height: 72.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 72.w,
                          height: 72.w,
                          child: CircularProgressIndicator(
                            value: _progressAnimation.value,
                            strokeWidth: 2.5.w,
                            backgroundColor:
                            Colors.white.withOpacity(0.3),
                            valueColor:
                            const AlwaysStoppedAnimation<Color>(
                                Colors.white),
                          ),
                        ),
                        Text(
                          '$percent%',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

