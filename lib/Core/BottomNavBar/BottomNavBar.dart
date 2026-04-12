
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../AppColor/app_color.dart';
import '../AppImages/app_images.dart';

class MainBottomNavBar extends StatelessWidget {
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
      color: AppColors.instance.orange,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navIcons
            .map(
              (icon) => GestureDetector(
            onTap: () {},
            child: Image.asset(icon, width: 26.w, height: 26.h),
          ),
        )
            .toList(),
      ),
    );
  }
}