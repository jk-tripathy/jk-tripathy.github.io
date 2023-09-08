import 'package:flutter/material.dart';

class LandingScreenText extends StatelessWidget {
  final double textBoxWidth;

  const LandingScreenText({super.key, required this.textBoxWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: textBoxWidth,
            child: Text(
              "Hi there! I'm",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                  ),
            ),
          ),
          SizedBox(
            width: textBoxWidth,
            child: Text(
              "Jatin",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                  "Researcher",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).hintColor,
                        fontFamily: "Carrois",
                      ),
                ),
                Text(
                  " + ",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColorLight,
                      ),
                ),
                Text(
                  "Developer",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).hintColor,
                        fontFamily: "Carrois",
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
