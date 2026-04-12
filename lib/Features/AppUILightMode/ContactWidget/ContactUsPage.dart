

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppColor/app_color.dart';
import 'package:naculis/Core/AppImages/app_images.dart';
import 'package:naculis/Features/AppUILightMode/ContactWidget/ReferFriendPage.dart';

import '../../../Core/BottomNavBar/BottomNavBar.dart';
import '../../../Core/CustomTextField/CustomTextField.dart';
import '../Auth/View/auth_widget.dart';
import '../Notifications/NotificationsWidget.dart';
import 'ContactWidget.dart' hide PrimaryButton, AppBar, BottomNavBar;

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
    return Scaffold(
      backgroundColor: AppColors.instance.bacgroundcolor,
      body: Column(
        children: [
          AppBar(),
          Expanded(
            child: SingleChildScrollView(
              padding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Illustration
                  Center(
                    child: Image.asset(AppImages.Contact)
                  ),
                  SizedBox(height: 16.h),

                  // Greeting
                  Center(
                    child: Text(
                      'Hello, how can we assist you?',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.instance.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Title label
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.instance.black,
                    ),
                  ),
                  SizedBox(height: 6.h),

                  // Title field
                  CustomTextField(
                    controller: _titleController,
                    hintText: 'Enter the title of your issue',
                  ),
                  SizedBox(height: 16.h),

                  // Write in below box label
                  Text(
                    'Write in bellow box',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.instance.black,
                    ),
                  ),
                  SizedBox(height: 6.h),

                  // Message field
                  CustomTextField(
                    controller: _messageController,
                    hintText: 'Write here...',
                  ),
                  SizedBox(height: 24.h),

                  // Send Button
                  PrimaryButton(
                    label: 'Send',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferFriendPage()));
                    },
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