import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/CustomTextField/CustomTextField.dart';
import '../../../Core/Theme/app_theme_colors.dart';
import 'ContactWidget.dart' hide BottomNavBar;
import 'ReferFriendPage.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Scaffold(
      backgroundColor: colors.background, // ✅
      body: Column(
        children: [
          AppBar(title: 'Contact Us'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(AppImages.Contact)),
                  SizedBox(height: 16.h),
                  Center(
                    child: Text(
                      'Hello, how can we assist you?',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: colors.normalText, // ✅
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: colors.normalText, // ✅
                    ),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    controller: _titleController,
                    hintText: 'Enter the title of your issue',
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Write in bellow box',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: colors.normalText, // ✅
                    ),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    controller: _messageController,
                    hintText: 'Write here...',
                  ),
                  SizedBox(height: 24.h),
                  PrimaryButton(
                    label: 'Send',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ReferFriendPage()),
                    ),
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