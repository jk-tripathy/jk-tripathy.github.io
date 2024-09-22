import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
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
                    child: navButtion(context),
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
                    child: navButtion(context),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }

  Widget navButtion(context) {
    return ElevatedButton(
      onPressed: () {
        // Button action
      },
      style: ButtonStyle(
        foregroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return Theme.of(context).focusColor;
          }
          return Theme.of(context).primaryColorDark;
        }),
      ),
      child: const Text('Welcome in'),
    );
  }
}
