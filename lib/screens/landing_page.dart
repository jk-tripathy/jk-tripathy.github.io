import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final double textBoxWidth;
  const LandingPage({super.key, required this.textBoxWidth});

  @override
  Widget build(BuildContext context) {
    return LandingScreenText(
      textBoxWidth: textBoxWidth,
    );
  }
}

class LandingScreenText extends StatelessWidget {
  final double textBoxWidth;

  const LandingScreenText({super.key, required this.textBoxWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: textBoxWidth,
          child: Text(
            "Hi!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
        ),
        SizedBox(
          width: textBoxWidth,
          child: Text(
            "I'm Jatin,",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
        ),
        SizedBox(
          width: textBoxWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "A ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
              Text(
                "Researcher ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).hintColor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              Text(
                "and ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
              Text(
                "Developer ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).hintColor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
