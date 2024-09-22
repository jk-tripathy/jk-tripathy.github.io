import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/dimensions.dart';

import 'package:portfolio/widgets/top_bar.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColorDark,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopBar(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Center(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final String transitionType;
                    final double sectionWidth;
                    if (constraints.maxWidth < mobileWidth) {
                      transitionType = 'topToBottom';
                      sectionWidth = MediaQuery.of(context).size.width * 0.6;
                    } else if (constraints.maxWidth < mobileWidth * 2) {
                      transitionType = 'rightToLeft';
                      sectionWidth = MediaQuery.of(context).size.width * 0.55;
                    } else if (constraints.maxWidth < mobileWidth * 2.7) {
                      transitionType = 'rightToLeft';
                      sectionWidth = MediaQuery.of(context).size.width * 0.45;
                    } else {
                      transitionType = 'rightToLeft';
                      sectionWidth = MediaQuery.of(context).size.width * 0.32;
                    }
                    List<Widget> widgetList = [
                      SectionsNav(
                        tag: 'about',
                        symbol: "",
                        text: 'Who I ',
                        emphText: 'Am',
                        transitionType: transitionType,
                        size: sectionWidth,
                      ),
                      SectionsNav(
                        tag: 'projects',
                        symbol: "+",
                        text: "What I've ",
                        emphText: 'Done',
                        transitionType: transitionType,
                        size: sectionWidth,
                      ),
                      SectionsNav(
                        tag: 'work',
                        symbol: "+",
                        text: 'Where I ',
                        emphText: 'Work',
                        transitionType: transitionType,
                        size: sectionWidth,
                      ),
                      SectionsNav(
                        tag: 'papers',
                        symbol: "+",
                        text: 'What Makes Me ',
                        emphText: 'Proud',
                        transitionType: transitionType,
                        size: sectionWidth,
                      ),
                      Hero(
                        tag: 'sectionsHero',
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: sectionWidth,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(
                                2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SectionsNav(
                        tag: 'contact',
                        symbol: "=",
                        text: 'Already ',
                        emphText: 'Like Me?',
                        transitionType: transitionType,
                        size: sectionWidth,
                      ),
                    ];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: widgetList,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SectionsNav extends StatelessWidget {
  final double size;
  final String symbol;
  final String text;
  final String emphText;
  final String tag;
  final String transitionType;

  const SectionsNav({
    super.key,
    required this.symbol,
    required this.text,
    required this.emphText,
    required this.tag,
    required this.transitionType,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: size,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              symbol,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).hintColor,
                    fontFamily: 'Carrois',
                  ),
            ),
            Row(
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColorLight,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    return GoRouter.of(context).go(
                      '/$tag',
                      extra: {
                        'transitionType': transitionType,
                      },
                    );
                  },
                  child: Text(
                    emphText,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).hintColor,
                          fontFamily: 'Carrois',
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
