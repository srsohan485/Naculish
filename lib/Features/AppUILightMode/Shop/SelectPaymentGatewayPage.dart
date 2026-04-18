import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Theme/app_theme_colors.dart';
import 'CardInformationPage.dart';
import 'ShopWidget.dart' hide BottomNav;

class GatewayOption {
  final String label;
  final Color color;
  const GatewayOption({required this.label, required this.color});
}

class SelectPaymentGatewayPage extends StatefulWidget {
  const SelectPaymentGatewayPage({super.key});

  @override
  State<SelectPaymentGatewayPage> createState() => SelectPaymentGatewayPageState();
}

class SelectPaymentGatewayPageState extends State<SelectPaymentGatewayPage> {
  int selected = 0;

  final List<GatewayOption> options = const [
    GatewayOption(label: 'PayPal', color: Color(0xFF003087)),
    GatewayOption(label: 'MC', color: Color(0xFFEB001B)),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: Column(
        children: [
          AppBar(title: 'Payment Method'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select payment gateway',
                    style: TextStyle(fontSize: 13.sp, color: colors.normalText),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: List.generate(options.length, (i) {
                      final opt = options[i];
                      final isSelected = selected == i;
                      return GestureDetector(
                        onTap: () => setState(() => selected = i),
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: isSelected ? opt.color : colors.inputFill, // ✅
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: isSelected ? opt.color : colors.border),
                          ),
                          child: Text(
                            opt.label,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : colors.normalText, // ✅
                              fontStyle: opt.label == 'PayPal' ? FontStyle.italic : FontStyle.normal,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  PrimaryButtonm(
                    label: 'Continue',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CardInformationPage())),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}