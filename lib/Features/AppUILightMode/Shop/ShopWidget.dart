
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppColor/app_color.dart';
import 'package:naculis/Core/AppText/app_text.dart';
import '../../../Core/AppImages/app_images.dart';
import 'SelectPaymentGatewayPage.dart';
import 'WithdhrawPayPal.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Top Stats Bar
// ─────────────────────────────────────────────────────────────────────────────
class TopStatsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Streak
        StatChip(
          icon: Icons.local_fire_department,
          iconColor: AppColors.instance.orange,
          value: '5',
        ),
        SizedBox(width: 8.w),
        // Hearts
        StatChip(
          icon: Icons.favorite,
          iconColor: AppColors.instance.error,
          value: '5',
        ),
        SizedBox(width: 8.w),
        // Star
        StatChip(
          icon: Icons.star,
          iconColor: AppColors.instance.start,
          value: '0',
        ),
        const Spacer(),
        // Gems
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.instance.cardBackground,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.instance.border),
          ),
          child: Row(
            children: [
              Icon(Icons.diamond, color: AppColors.instance.primary500, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                '300',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.instance.dark500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;

  const StatChip({
    required this.icon,
    required this.iconColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 18.sp),
        SizedBox(width: 3.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.instance.dark500,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Gems Available Card
// ─────────────────────────────────────────────────────────────────────────────
class GemsAvailableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.instance.white50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.instance.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '300',
                      style: TextStyle(
                        fontSize: 48.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.instance.orange,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(AppImages.Vector,width: 20.w,height: 50.h,)
                  ],
                ),
                Text(AppStrings.gemsAvailable,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.instance.orange,
                  ),
                ),
              ],
            )
          ),
          SizedBox(height: 12.h),



          // Exchange button
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Withdhrawpaypal()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.instance.green500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                AppStrings.exchange,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.instance.white50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GemProgressBar extends StatelessWidget {
  final int value;
  final int max;

  const GemProgressBar({required this.value, required this.max});

  @override
  Widget build(BuildContext context) {
    final ratio = value / max;
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: AppColors.instance.border,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: ratio,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.instance.green500,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Gem to USD Card
// ─────────────────────────────────────────────────────────────────────────────
class GemToUsdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.instance.bacgroundcolor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.instance.orange),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.Vector),
              SizedBox(width: 8.w),
              Text(
                AppStrings.gemToUSD,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.instance.dark500,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Info rows
          InfoRow(label: 'Gem', value: '1300'),
          SizedBox(height: 6.h),
          InfoRow(label: AppStrings.withdrawAmount.split(':')[0].trim(),
              value: AppStrings.withdrawAmount.split(':')[1].trim()),
          SizedBox(height: 14.h),
          Divider(color: AppColors.instance.border, height: 1),
          SizedBox(height: 14.h),

          // Paypal email field
          Text(
            AppStrings.paypalEmail,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.instance.dark500,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            height: 44.h,
            decoration: BoxDecoration(
              color: AppColors.instance.cardBackground,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.instance.border),
            ),
            child: TextField(
              style: TextStyle(fontSize: 13.sp, color: AppColors.instance.dark500),
              decoration: InputDecoration(
                hintText: AppStrings.exampleEmail,
                hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.instance.hintText),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 14.h),

          // Withdraw button
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectPaymentGatewayPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.instance.green500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                AppStrings.withdrawToPaypal,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.instance.white50,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Notes
          NoteRow(text: AppStrings.minWithdraw),
          SizedBox(height: 4.h),
          NoteRow(text: AppStrings.processingTime),
          SizedBox(height: 4.h),
          NoteRow(text: AppStrings.privacyNote),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(fontSize: 12.sp, color: AppColors.instance.hintText)),
        Text(value,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.instance.dark500)),
      ],
    );
  }
}

class NoteRow extends StatelessWidget {
  final String text;
  const NoteRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ', style: TextStyle(fontSize: 11.sp, color: AppColors.instance.hintText)),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 11.sp, color: AppColors.instance.hintText),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Heart Recharge Card
// ─────────────────────────────────────────────────────────────────────────────
class HeartRechargeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.instance.white50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.instance.border),
      ),
      child: Row(
        children: [
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.Heart),
                    SizedBox(width: 10,),
                    Text(
                      AppStrings.heartRecharge,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.instance.orange,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 4.h),
                Text(
                  AppStrings.heartsRestore,
                  style: TextStyle(fontSize: 16.sp, color: AppColors.instance.orange),
                ),
                SizedBox(height: 2.h),
                Column(
                  children: [
                    Text(
                      AppStrings.heartsFull,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.instance.orange,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.heartsMax,
                      style: TextStyle(fontSize: 16.sp, color: AppColors.instance.orange),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Premium Subscription Card
// ─────────────────────────────────────────────────────────────────────────────
class PremiumSubscriptionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.instance.white50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.instance.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Popular badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.workspace_premium,
                  color: AppColors.instance.start, size: 22.sp),
              SizedBox(width: 8.w),
              Text(
                AppStrings.premiumSubscription,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.instance.orange,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.instance.orange,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  AppStrings.popular,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.instance.white50,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Remove ads text
          Text(
            AppStrings.removeAds,
            style: TextStyle(fontSize: 12.sp, color: AppColors.instance.orange),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price row
              Column(
                children: [
                  Text(
                    AppStrings.price,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.instance.dark500,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Text(
                      AppStrings.perMonth,
                      style:
                      TextStyle(fontSize: 12.sp, color: AppColors.instance.hintText),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // Subscribe button
              SizedBox(
                height: 44.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.instance.green500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppStrings.subscribe,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.instance.white50,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bottom Navigation Bar
// ─────────────────────────────────────────────────────────────────────────────
class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        color: AppColors.instance.white50,
        border: Border(top: BorderSide(color: AppColors.instance.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavIcon(icon: Icons.map_outlined, isActive: false),
          NavIcon(icon: Icons.grid_view_rounded, isActive: false),
          NavIcon(icon: Icons.emoji_events_outlined, isActive: false),
          NavIcon(icon: Icons.star_border_rounded, isActive: false),
          NavIcon(icon: Icons.shopping_bag_outlined, isActive: true),
          NavIcon(icon: Icons.person_outline_rounded, isActive: false),
        ],
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const NavIcon({required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 26.sp,
      color: isActive ? AppColors.instance.orange : AppColors.instance.hintText,
    );
  }
}

class AppBar extends StatelessWidget {
  final String title;
  const AppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.instance.box,
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
              child:
              Icon(Icons.chevron_left, size: 28.sp, color: AppColors.instance.black),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.instance.black,
            ),
          ),
        ],
      ),
    );
  }
}

class InputFieldm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final bool obscureText;

  const InputFieldm({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(fontSize: 13.sp, color: AppColors.instance.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.instance.hintText, fontSize: 13.sp),
        filled: true,
        fillColor: AppColors.instance.boxcard,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.instance.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.instance.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.instance.orange, width: 1.5),
        ),
      ),
    );
  }
}

class PrimaryButtonm extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const PrimaryButtonm({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.instance.green,
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
            color: AppColors.instance.white50,
          ),
        ),
      ),
    );
  }
}