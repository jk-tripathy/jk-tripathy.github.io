import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
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
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).hintColor,
                    fontFamily: "Carrois",
                  ),
            ),
            iconGroup(context),
          ],
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
          LinkButton(
            url: 'https://github.com/jatinkarthik-tripathy/',
            img: 'assets/img/github.png',
            imgDim: imgDim,
          ),
          LinkButton(
            url: 'https://www.linkedin.com/in/jatinkarthik-tripathy/',
            img: 'assets/img/linkedin.png',
            imgDim: imgDim,
          ),
          LinkButton(
            img: 'assets/img/cv.png',
            imgDim: imgDim,
          ),
        ],
      ),
    );
  }
}
