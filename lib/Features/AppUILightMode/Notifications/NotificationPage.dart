
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppColor/app_color.dart';

import '../../../Core/BottomNavBar/BottomNavBar.dart';
import 'NotificationsWidget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const _todayItems = [
    NotifItem(
      title: '30% Special Discount',
      desc: 'Special promotion only valid today',
      type: NotifType.discount,
    ),
    NotifItem(
      title: 'Password Update Successfully',
      desc: 'Your Password Update Successfully',
      type: NotifType.success,
    ),
  ];

  static const _yesterdayItems = [
    NotifItem(
      title: '30% Special Discount',
      desc: 'Special promotion only valid today',
      type: NotifType.discount,
    ),
    NotifItem(
      title: '30% Special Discount',
      desc: 'Special promotion only valid today',
      type: NotifType.discount,
    ),
    NotifItem(
      title: '30% Special Discount',
      desc: 'Special promotion only valid today',
      type: NotifType.discount,
    ),
    NotifItem(
      title: '30% Special Discount',
      desc: 'Special promotion only valid today',
      type: NotifType.discount,
    ),
    NotifItem(
      title: 'Password Update Successfully',
      desc: 'Your Password Update Successfully',
      type: NotifType.success,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.bacgroundcolor,
      body: Column(
        children: [
          // ── App Bar
          AppBar(),

          // ── Body
          Expanded(
            child: SingleChildScrollView(
              padding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Today
                  SectionLabel(label: 'Today'),
                  SizedBox(height: 8.h),
                  ..._todayItems.map((item) => NotifCard(item: item)),

                  SizedBox(height: 16.h),

                  // Yesterday
                  SectionLabel(label: 'Yesterday'),
                  SizedBox(height: 8.h),
                  ..._yesterdayItems.map((item) => NotifCard(item: item)),
                ],
              ),
            ),
          ),

          // ── Bottom Nav

        ],
      ),
    );
  }
}