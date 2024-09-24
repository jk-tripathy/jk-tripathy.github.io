import 'dart:io';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/custom_hero.dart';
import 'package:portfolio/widgets/link_button.dart';
import 'dart:convert' show base64Encode, utf8;
import 'package:web/web.dart' as web;

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
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
                File cv = File('assets/Tripathy_Jatin_CV.pdf');
                final bytes = cv.readAsBytesSync();
                final web.HTMLAnchorElement anchor =
                    web.document.createElement('a') as web.HTMLAnchorElement
                      ..href =
                          "data:application/octet-stream;base64,${base64Encode(bytes)}"
                      ..style.display = 'none'
                      ..download = 'Tripathy_Jatin_CV.pdf';

                web.document.body!.appendChild(anchor);
                anchor.click();
                web.document.body!.removeChild(anchor);
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
