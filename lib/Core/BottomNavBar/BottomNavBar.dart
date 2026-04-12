
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../AppColor/app_color.dart';
import '../AppImages/app_images.dart';

class MainBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const MainBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final navIcons = [
      AppImages.Icon1,
      AppImages.Icon2,
      AppImages.Icon3,
      AppImages.Icon4,
      AppImages.Icon5,
      AppImages.Icon6,
    ];

    return Container(
      width: double.infinity,
      color: AppColors.instance.card,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          navIcons.length,
              (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Opacity(
              opacity: selectedIndex == index ? 1.0 : 0.5,
              child: Image.asset(
                navIcons[index],
                width: 26.w,
                height: 26.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
final List<Widget> pages = [
      HomeMapScreen(),
      SpeakScreen(),
      LeaderboardScreen(),
      QuestMenuScreen(),
      ShopScreen(),
      ProfileScreen(),
    ];
 */