import 'package:flutter/material.dart';

class CustomHero extends StatelessWidget {
  final Widget child;
  const CustomHero({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
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
