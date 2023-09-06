import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';

class ResponsiveUI extends StatelessWidget {
  const ResponsiveUI({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return Container();
      } else {
        return SizedBox.expand(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    "Hi!",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    "I'm Jatin,",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                        ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "A ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).primaryColorLight,
                            ),
                      ),
                      Text(
                        "Researcher ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).hintColor,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Text(
                        "and ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).primaryColorLight,
                            ),
                      ),
                      Text(
                        "Developer ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).hintColor,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
