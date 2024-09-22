import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/landing_screen_text.dart';
import 'package:go_router/go_router.dart';

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
              return MobileView(context);
            } else {
              // DESKTOP
              return DesktopView(context);
            }
          }),
        ),
      ),
    );
  }

  Stack DesktopView(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LandingScreenText(
          textBoxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          left: MediaQuery.of(context).size.width * 0.55,
          child: navButton(
            context,
            'rightToLeft',
          ),
        ),
      ],
    );
  }

  Stack MobileView(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LandingScreenText(
          textBoxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.6,
          left: MediaQuery.of(context).size.width * 0.5,
          child: navButton(
            context,
            'topToBottom',
          ),
        ),
      ],
    );
  }

  Widget navButton(
    context,
    transitionType,
  ) {
    return Hero(
      tag: 'hero',
      child: ElevatedButton(
        onPressed: () {
          return GoRouter.of(context).go(
            '/home',
            extra: {'transitionType': transitionType},
          );
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
        child: const Padding(
          padding: EdgeInsets.all(6.0),
          child: Text('Welcome in'),
        ),
      ),
    );
  }
}
