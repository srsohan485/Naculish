

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppColor/app_color.dart';
import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../../../Core/PrimaryButton/PrimaryButton.dart';
import 'CardInformationPage.dart';


class SelectPaymentGatewayPage extends StatefulWidget {
  const SelectPaymentGatewayPage({super.key});

  @override
  State<SelectPaymentGatewayPage> createState() =>
      SelectPaymentGatewayPageState();
}

class GatewayOption {
  final String label;
  final Color color;
  const GatewayOption({required this.label, required this.color});
}

class SelectPaymentGatewayPageState extends State<SelectPaymentGatewayPage> {
  int selected = 0; // 0 = PayPal, 1 = MasterCard

  final List<GatewayOption> options =  [
    GatewayOption(label: 'PayPal', color: Color(0xFF003087)),
    GatewayOption(label: 'MC', color: Color(0xFFEB001B)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.box,
      body: Column(
        children: [
          AppBar(title: Text('Payment Method')),
          Expanded(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select payment gateway',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.instance.black
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Gateway chips
                  Row(
                    children: List.generate(options.length, (i) {
                      final opt = options[i];
                      final isSelected = selected == i;
                      return GestureDetector(
                        onTap: () => setState(() => selected = i),
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: isSelected ? opt.color : AppColors.instance.white50,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color:
                              isSelected ? opt.color : AppColors.instance.border,
                            ),
                          ),
                          child: Text(
                            opt.label,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? AppColors.instance.white50 : AppColors.instance.black,
                              fontStyle: opt.label == 'PayPal'
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const Spacer(),

                  // Continue button
                  PrimaryButton(
                    label: 'Continue',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const CardInformationPage()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MainBottomNavBar(),
        ],
      ),
    );
  }
}