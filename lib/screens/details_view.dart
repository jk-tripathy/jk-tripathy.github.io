import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/half_circle_container.dart';
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
              height: MediaQuery.of(context).size.height * 0.91,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < mobileWidth) {
                  final primaryColorLight = Theme.of(context).primaryColorLight;
                  final focusColor = Theme.of(context).focusColor;
                  final diameter = min(
                    constraints.maxWidth / 2,
                    constraints.maxHeight,
                  );
                  List<Widget> widgetList = [
                    Hero(
                      tag: tag,
                      child: HalfCircleContainer(
                        tag: tag,
                        diameter: diameter,
                        constraints: constraints,
                        primaryColorLight: primaryColorLight,
                        focusColor: focusColor,
                      ),
                    ),
                  ];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widgetList,
                  );
                } else {
                  final primaryColorLight = Theme.of(context).primaryColorLight;
                  final focusColor = Theme.of(context).focusColor;
                  final diameter = min(
                    constraints.maxWidth,
                    constraints.maxHeight / 2,
                  );

                  List<Widget> widgetList = [
                    Hero(
                      tag: tag,
                      child: HalfCircleContainer(
                        tag: tag,
                        diameter: diameter,
                        constraints: constraints,
                        primaryColorLight: primaryColorLight,
                        focusColor: focusColor,
                      ),
                    ),
                  ];
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
