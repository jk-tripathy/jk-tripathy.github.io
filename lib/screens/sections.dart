import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/screens/details_view.dart';

import 'package:portfolio/widgets/top_bar.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future(() => true);
      },
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
                    final PageTransitionType transitionType;
                    final double sectionWidth;
                    if (constraints.maxWidth < mobileWidth) {
                      transitionType = PageTransitionType.topToBottom;
                      sectionWidth = MediaQuery.of(context).size.width * 0.6;
                    } else if (constraints.maxWidth < mobileWidth * 2) {
                      transitionType = PageTransitionType.rightToLeft;
                      sectionWidth = MediaQuery.of(context).size.width * 0.55;
                    } else if (constraints.maxWidth < mobileWidth * 2.7) {
                      transitionType = PageTransitionType.rightToLeft;
                      sectionWidth = MediaQuery.of(context).size.width * 0.45;
                    } else {
                      transitionType = PageTransitionType.rightToLeft;
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
  final PageTransitionType transitionType;

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
                    Navigator.push(
                      context,
                      PageTransition(
                        type: transitionType,
                        duration: const Duration(milliseconds: 600),
                        reverseDuration: const Duration(milliseconds: 600),
                        child: DetailsView(
                          tag: tag,
                        ),
                        childCurrent: this,
                      ),
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
