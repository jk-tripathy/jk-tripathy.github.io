import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';

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
              Hero(
                tag: 'sectionsHero',
                child: Container(
                  color: Theme.of(context).primaryColorLight,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "JKT",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: Theme.of(context).hintColor,
                                  fontFamily: "Carrois",
                                ),
                      ),
                      iconGroup(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconGroup(BuildContext context) {
    double sizedBoxDim;
    double imgDim;
    if (MediaQuery.of(context).size.width < mobileWidth) {
      // MOBILE
      sizedBoxDim = MediaQuery.of(context).size.width * 0.4;
      imgDim = MediaQuery.of(context).size.width * 0.07;
    } else {
      // DESKTOP
      sizedBoxDim = MediaQuery.of(context).size.height * 0.25;
      imgDim = MediaQuery.of(context).size.height * 0.06;
    }
    return SizedBox(
      width: sizedBoxDim,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () async => html.window
                .open('https://github.com/jatinkarthik-tripathy/', "_blank"),
            child: Image.asset(
              width: imgDim,
              height: imgDim,
              fit: BoxFit.cover,
              'assets/img/github.png',
            ),
          ),
          GestureDetector(
            onTap: () async => html.window.open(
                'https://www.linkedin.com/in/jatinkarthik-tripathy/', "_blank"),
            child: Image.asset(
              width: imgDim,
              height: imgDim,
              fit: BoxFit.cover,
              'assets/img/linkedin.png',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              width: imgDim,
              height: imgDim,
              fit: BoxFit.cover,
              'assets/img/cv.png',
            ),
          ),
        ],
      ),
    );
  }
}
