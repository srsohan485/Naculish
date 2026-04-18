import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppBar/AppBar.dart';
import '../../../Core/AppImages/app_images.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'PaymentSuccessPage.dart';
import 'ShopWidget.dart' hide BottomNav;

class CardInformationPage extends StatefulWidget {
  const CardInformationPage({super.key});

  @override
  State<CardInformationPage> createState() => CardInformationPageState();
}

class CardInformationPageState extends State<CardInformationPage> {
  final cardNumberCtrl = TextEditingController();
  final holderCtrl = TextEditingController();
  final expiryCtrl = TextEditingController();
  final cvvCtrl = TextEditingController();
  bool saveCard = false;

  @override
  void dispose() {
    cardNumberCtrl.dispose();
    holderCtrl.dispose();
    expiryCtrl.dispose();
    cvvCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.accentOrangeBox, // ✅
      body: Column(
        children: [
          MainAppBar(title: 'Payment Method'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Information',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: colors.normalText),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Image.asset(AppImages.VisaCard, height: 160.h, fit: BoxFit.contain),
                  ),
                  SizedBox(height: 20.h),
                  InputFieldm(controller: cardNumberCtrl, hintText: 'Card Number', keyboardType: TextInputType.number),
                  SizedBox(height: 12.h),
                  InputFieldm(controller: holderCtrl, hintText: 'Card Holder Name'),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: InputFieldm(controller: expiryCtrl, hintText: 'Expires on', keyboardType: TextInputType.datetime),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: InputFieldm(controller: cvvCtrl, hintText: 'CVV Number', keyboardType: TextInputType.number),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => saveCard = !saveCard),
                        child: Container(
                          width: 18.w,
                          height: 18.w,
                          decoration: BoxDecoration(
                            color: saveCard ? colors.accentOrange : colors.inputFill, // ✅
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: colors.border),
                          ),
                          child: saveCard
                              ? Icon(Icons.check, color: Colors.white, size: 12.sp)
                              : null,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text('Save this card for future',
                          style: TextStyle(fontSize: 12.sp, color: colors.normalText)),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  PrimaryButtonm(
                    label: 'Process to Payment',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentSuccessPage())),
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