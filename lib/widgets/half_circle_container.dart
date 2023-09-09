import 'package:flutter/material.dart';

class HalfCircleContainer extends StatelessWidget {
  const HalfCircleContainer({
    super.key,
    required this.tag,
    required this.diameter,
    required this.constraints,
    required this.primaryColorLight,
    required this.focusColor,
  });

  final String tag;
  final double diameter;
  final Color primaryColorLight;
  final Color focusColor;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
          width: diameter,
          height: constraints.maxHeight,
        ),
        Positioned(
          left: -diameter / 2,
          child: Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColorLight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "FUCK",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: focusColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
