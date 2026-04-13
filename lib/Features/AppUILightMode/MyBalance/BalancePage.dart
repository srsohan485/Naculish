


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide TabBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naculis/Core/AppColor/app_color.dart';

import 'Balancewidget.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  ActivityTab _selectedTab = ActivityTab.received;

  static const _transactions = [
    Transaction(
      id: '# 123A2CC 58J',
      source: '1st Avenue Slang',
      date: 'Today - 10 April, 2025',
      amount: '+\$150',
      status: TransactionStatus.completed,
    ),
    Transaction(
      id: '# 123A2CC 58J',
      source: '1st Avenue Slang',
      date: 'Today - 10 April, 2025',
      amount: '+\$150',
      status: TransactionStatus.completed,
    ),
  ];

  static const _requestedTransactions = [
    Transaction(
      id: '# 123A2CC 58J',
      source: '1st Avenue Slang',
      date: 'Today - 10 April, 2025',
      amount: '+\$150',
      status: TransactionStatus.pending,
    ),
    Transaction(
      id: '# 123A2CC 58J',
      source: '1st Avenue Slang',
      date: 'Today - 10 April, 2025',
      amount: '+\$150',
      status: TransactionStatus.pending,
    ),
  ];

  static const _rejectedTransactions = [
    Transaction(
      id: '# 123A2CC 58J',
      source: '1st Avenue Slang',
      date: 'Today - 10 April, 2025',
      amount: '+\$150',
      status: TransactionStatus.rejected,
    ),
    Transaction(
      id: '# 123A2CC 58J',
      source: '1st Avenue Slang',
      date: 'Today - 10 April, 2025',
      amount: '+\$150',
      status: TransactionStatus.rejected,
    ),
  ];

  List<Transaction> get _currentTransactions {
    switch (_selectedTab) {
      case ActivityTab.received:
        return _transactions;
      case ActivityTab.requested:
        return _requestedTransactions;
      case ActivityTab.rejected:
        return _rejectedTransactions;
    }
  }

  void _showWithdrawSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const WithdrawBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.bacgroundcolor,
      body: Column(
        children: [
          Header(onWithdraw: _showWithdrawSheet),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Activity',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.instance.black,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TabBar(
                    selected: _selectedTab,
                    onTabChanged: (t) => setState(() => _selectedTab = t),
                  ),
                  SizedBox(height: 16.h),
                  ..._currentTransactions
                      .asMap()
                      .entries
                      .map((e) => Padding(
                    padding: EdgeInsets.only(
                        bottom: e.key < _currentTransactions.length - 1
                            ? 12.h
                            : 0),
                    child: TransactionCard(
                      transaction: e.value,
                      isHighlighted: _selectedTab ==
                          ActivityTab.requested &&
                          e.key == 0,
                    ),
                  )),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}