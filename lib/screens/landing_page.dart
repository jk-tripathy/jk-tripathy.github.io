import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/screens/sections.dart';
import 'package:portfolio/widgets/landing_screen_text.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < mobileWidth) {
              // MOBILE
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  LandingScreenText(
                    textBoxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.6,
                    left: MediaQuery.of(context).size.width * 0.5,
                    child: navButton(context),
                  ),
                ],
              );
            } else {
              // DESKTOP
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  LandingScreenText(
                    textBoxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.7,
                    left: MediaQuery.of(context).size.width * 0.6,
                    child: navButton(context),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }

  Widget navButton(context) {
    return Hero(
      tag: 'sectionsHero',
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              reverseTransitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (_, __, ___) => const Sections(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: 0.0, end: 1.0);
                final fadeAnimation = animation.drive(tween);
                return FadeTransition(
                  opacity: fadeAnimation,
                  child: child,
                );
              },
            ),
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).focusColor;
            }
            return Theme.of(context).primaryColorDark;
          }),
        ),
        child: const Text('Welcome in'),
      ),
    );
  }
}
