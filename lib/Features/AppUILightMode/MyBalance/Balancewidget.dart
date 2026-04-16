import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/AppImages/app_images.dart';
import '../../../Core/Theme/app_theme_colors.dart';

// ── Models ────────────────────────────────────────────────────────────────────
enum ActivityTab { received, requested, rejected }
enum TransactionStatus { completed, pending, rejected }

class Transaction {
  final String id;
  final String source;
  final String date;
  final String amount;
  final TransactionStatus status;

  const Transaction({
    required this.id,
    required this.source,
    required this.date,
    required this.amount,
    required this.status,
  });
}

// ── Header ────────────────────────────────────────────────────────────────────
class Header extends StatelessWidget {
  final VoidCallback onWithdraw;
  const Header({required this.onWithdraw});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      width: double.infinity,
      color: colors.accentOrange, // ✅
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20.h,
        bottom: 24.h,
      ),
      child: Column(
        children: [
          Text(
            '\$12,000',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Available Balance',
            style: TextStyle(fontSize: 13.sp, color: Colors.white.withOpacity(0.9)),
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: onWithdraw,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                'Withdraw',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: colors.accentOrange, // ✅
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Tab Bar ───────────────────────────────────────────────────────────────────
class TabBar extends StatelessWidget {
  final ActivityTab selected;
  final ValueChanged<ActivityTab> onTabChanged;

  const TabBar({required this.selected, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Row(
      children: ActivityTab.values.map((tab) {
        final isSelected = tab == selected;
        final label = tab.name[0].toUpperCase() + tab.name.substring(1);

        return GestureDetector(
          onTap: () => onTabChanged(tab),
          child: Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isSelected ? colors.card : Colors.transparent, // ✅
              border: Border.all(
                color: isSelected ? colors.normalText : colors.border, // ✅
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: colors.normalText, // ✅
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ── Transaction Card ──────────────────────────────────────────────────────────
class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final bool isHighlighted;

  const TransactionCard({
    required this.transaction,
    this.isHighlighted = false,
  });

  Color _statusColor(AppThemeColors colors) {
    switch (transaction.status) {
      case TransactionStatus.completed:
        return colors.success; // ✅
      case TransactionStatus.pending:
        return colors.accentOrange; // ✅
      case TransactionStatus.rejected:
        return colors.error; // ✅
    }
  }

  String get _statusLabel {
    switch (transaction.status) {
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.rejected:
        return 'Rejected';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colors.card, // ✅
        borderRadius: BorderRadius.circular(10.r),
        border: isHighlighted
            ? Border.all(color: colors.accentOrange, width: 1.5) // ✅
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.id,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.normalText, // ✅
                ),
              ),
              Text(
                transaction.amount,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: colors.normalText, // ✅
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.source,
                style: TextStyle(fontSize: 12.sp, color: colors.subText), // ✅
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.date,
                style: TextStyle(fontSize: 11.sp, color: colors.subText), // ✅
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [PaypalBadge()],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: _statusColor(colors),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                _statusLabel,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── PayPal Badge ──────────────────────────────────────────────────────────────
class PaypalBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: colors.card, // ✅
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        'PayPal',
        style: TextStyle(
          fontSize: 10.sp,
          color: colors.accentOrange, // ✅
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

// ── Withdraw Bottom Sheet ─────────────────────────────────────────────────────
class WithdrawBottomSheet extends StatefulWidget {
  const WithdrawBottomSheet();

  @override
  State<WithdrawBottomSheet> createState() => WithdrawBottomSheetState();
}

class WithdrawBottomSheetState extends State<WithdrawBottomSheet> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors; // ✅

    return Container(
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.card, // ✅
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20.w,
          20.h,
          20.w,
          MediaQuery.of(context).viewInsets.bottom + 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Withdraw',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: colors.normalText, // ✅
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: colors.error, // ✅
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, color: Colors.white, size: 16.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'You can withdraw 10.00\$ , 24 hours auto pay on your account',
              style: TextStyle(fontSize: 12.sp, color: colors.subText), // ✅
            ),
            SizedBox(height: 16.h),
            Text(
              'Amount \$',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: colors.normalText, // ✅
              ),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 14.sp, color: colors.normalText),
              decoration: InputDecoration(
                hintText: '\$ : 0.00',
                hintStyle: TextStyle(color: colors.hintText, fontSize: 13.sp),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: colors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: colors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: colors.accentOrange), // ✅
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: colors.normalText, // ✅
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                border: Border.all(color: colors.border), // ✅
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [PaypalBadge()],
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primaryBtn, // ✅
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Submit Request',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}