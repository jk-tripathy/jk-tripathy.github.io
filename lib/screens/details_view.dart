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
              height: MediaQuery.of(context).size.height * 0.91,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < mobileWidth) {
                  List<Widget> widgetList = [];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widgetList,
                  );
                } else {
                  final primaryColorLight = Theme.of(context).primaryColorLight;
                  final focusColor = Theme.of(context).focusColor;
                  List<Widget> widgetList = [
                    Hero(
                      tag: tag,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SizedBox.square(
                            dimension: min(
                              constraints.maxWidth,
                              constraints.maxHeight / 2,
                            ),
                            child: CustomPaint(
                              size: Size(
                                constraints.maxWidth,
                                constraints.maxHeight,
                              ),
                              painter: HalfCirclePainter(
                                primaryColorLight: primaryColorLight,
                                focusColor: focusColor,
                              ),
                            ),
                          ),
                          Text(
                            "FUCK",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                          ),
                        ],
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

class HalfCirclePainter extends CustomPainter {
  final Color primaryColorLight;
  final Color focusColor;

  const HalfCirclePainter({
    required this.primaryColorLight,
    required this.focusColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(0, size.height / 2);
    final radius = size.width / 2;
    final radiusRed = size.width / 2 + 10;

    final paintFocus = Paint()
      ..color = focusColor
      ..style = PaintingStyle.fill;
    final paintPrimary = Paint()
      ..color = primaryColorLight
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radiusRed),
      3 * 3.14 / 2,
      3.14,
      true,
      paintFocus,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3 * 3.14 / 2,
      3.14,
      true,
      paintPrimary,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
