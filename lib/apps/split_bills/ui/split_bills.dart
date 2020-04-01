import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_home.dart';
import 'package:flutter/material.dart';

class SplitBills extends StatelessWidget {
  final PageController _pageController;

  SplitBills(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SplitBillsColors.BACKGROUND_COLOR,
      child: SplitBillsHome(_pageController),
    );
  }
}
