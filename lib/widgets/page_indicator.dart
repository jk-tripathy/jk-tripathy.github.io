import 'dart:math';

import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex != 0) {
                onUpdateCurrentPageIndex(currentPageIndex - 1);
              }
            },
            icon: Icon(
              Icons.arrow_left_rounded,
              size: min(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.065,
              ),
              color: Theme.of(context).hintColor,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            indicatorSize: min(
              MediaQuery.of(context).size.width * 0.1 / 4,
              MediaQuery.of(context).size.height * 0.065 / 4,
            ),
            color: Theme.of(context).primaryColorLight,
            selectedColor: Theme.of(context).hintColor,
            borderStyle: BorderStyle.none,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex != tabController.length - 1) {
                onUpdateCurrentPageIndex(currentPageIndex + 1);
              }
            },
            icon: Icon(
              Icons.arrow_right_rounded,
              size: min(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.065,
              ),
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
