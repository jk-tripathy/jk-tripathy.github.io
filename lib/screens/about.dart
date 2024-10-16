import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/bottom_wave.dart';
import 'package:portfolio/widgets/custom_hero.dart';
import 'package:portfolio/widgets/top_bar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Stack(
          children: [
            BottomWave(),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TopBar(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < mobileWidth) {
                        return MobileView(context);
                      } else {
                        return DesktopView(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column MobileView(BuildContext context) {
    List<Widget> widgetList = [
      Image(
        image: AssetImage('assets/img/me-circle.png'),
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.height * 0.25,
      ),
      CustomHero(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
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
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Center(
          child: Text(
            "Coming out of a Master’s degree and a year’s worth of experience as a research assistant at DFKI and several papers published in reputed journals, I have proven to have good experience with Machine Learning, Natural Language Processing, and the basics of software development. ",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgetList,
    );
  }

  Row DesktopView(BuildContext context) {
    List<Widget> widgetList = [
      Image(
        image: AssetImage('assets/img/me.jpg'),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.height * 0.4,
      ),
      CustomHero(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: 4,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(
                2,
              ),
            ),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.60,
        child: Center(
          child: Text(
            "Coming out of a Master’s degree and a year’s worth of experience as a research assistant at DFKI and several papers published in reputed journals, I have proven to have good experience with Machine Learning, Natural Language Processing, and the basics of software development. ",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ];
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgetList,
    );
  }
}
