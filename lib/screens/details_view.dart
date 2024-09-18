import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/top_bar.dart';

class DetailsView extends StatelessWidget {
  final String tag;
  const DetailsView({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopBar(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < mobileWidth) {
                  List<Widget> widgetList = [];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widgetList,
                  );
                } else {
                  List<Widget> widgetList = [];
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widgetList,
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
