import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/custom_hero.dart';
import 'package:portfolio/widgets/link_button.dart';

class TopBar extends StatelessWidget {
  final bool showBackButton;
  final bool showIconGroup;
  const TopBar({
    super.key,
    this.showBackButton = true,
    this.showIconGroup = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: showBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    iconSize: min(
                      MediaQuery.of(context).size.height * 0.045,
                      MediaQuery.of(context).size.width * 0.045,
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  )
                : Text(
                    "JKT",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Carrois",
                        ),
                  ),
          ),
          showIconGroup
              ? iconGroup(context)
              : SizedBox(width: MediaQuery.of(context).size.width * 0.85),
        ],
      ),
    );
  }

  Widget iconGroup(BuildContext context) {
    double sizedBoxDim;
    double imgDim;
    if (MediaQuery.of(context).size.width < mobileWidth) {
      // MOBILE
      sizedBoxDim = MediaQuery.of(context).size.width * 0.45;
      imgDim = MediaQuery.of(context).size.width * 0.06;
    } else {
      // DESKTOP
      sizedBoxDim = MediaQuery.of(context).size.height * 0.35;
      imgDim = MediaQuery.of(context).size.height * 0.05;
    }
    return SizedBox(
      width: sizedBoxDim,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomHero(
            tag: 'github',
            child: LinkButton(
              url: 'https://github.com/jk-tripathy',
              img: 'assets/img/github.png',
              imgDim: imgDim,
            ),
          ),
          CustomHero(
            tag: 'linkedin',
            child: LinkButton(
              url: 'https://www.linkedin.com/in/jk-tripathy/',
              img: 'assets/img/linkedin.png',
              imgDim: imgDim,
            ),
          ),
          CustomHero(
            tag: 'cv',
            child: IconButton(
              onPressed: () async {
                var data =
                    await rootBundle.load('assets/Tripathy_Jatin_CV.pdf');
                final bytes = data.buffer.asUint8List();
                final blob = html.Blob([bytes]);
                final url = html.Url.createObjectUrlFromBlob(blob);
                final anchor =
                    html.document.createElement('a') as html.AnchorElement
                      ..href = url
                      ..style.display = 'none'
                      ..download = 'Tripathy_Jatin_CV.pdf';
                html.document.body!.children.add(anchor);
                anchor.click();
                html.document.body!.children.remove(anchor);
                html.Url.revokeObjectUrl(url);
              },
              icon: Image.asset(
                width: imgDim,
                height: imgDim,
                fit: BoxFit.cover,
                'assets/img/cv.png',
              ),
            ),
          ),
          CustomHero(
            tag: 'mail',
            child: LinkButton(
              url: 'mailto:jatinkarthikt@gmail.com',
              img: 'assets/img/mail.png',
              imgDim: imgDim,
            ),
          ),
        ],
      ),
    );
  }
}
