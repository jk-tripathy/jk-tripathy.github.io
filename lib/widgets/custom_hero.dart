import 'package:flutter/material.dart';

class CustomHero extends StatelessWidget {
  final Widget child;
  final String tag;
  const CustomHero({super.key, required this.child, this.tag = 'hero'});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        return AnimatedCrossFade(
          firstChild: fromHeroContext.widget,
          secondChild: toHeroContext.widget,
          firstCurve: Curves.easeInOut,
          secondCurve: Curves.easeInOut,
          crossFadeState: flightDirection == HeroFlightDirection.push
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 1000),
          reverseDuration: const Duration(milliseconds: 1000),
        );
      },
      transitionOnUserGestures: true,
      child: child,
    );
  }
}
