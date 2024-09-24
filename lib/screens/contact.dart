import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/custom_hero.dart';
import 'package:portfolio/widgets/link_button.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth < mobileWidth
                    ? MediaQuery.of(context).size.width * 0.75
                    : MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.60,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage('assets/img/me-circle.png'),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Text(
                      "Jatin Karthik Tripathy",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context).primaryColorLight,
                              ),
                    ),
                    Text(
                      "Researcher | Developer | Engineer",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).hintColor,
                            fontFamily: "Carrois",
                          ),
                    ),
                    Divider(
                      color: Theme.of(context).primaryColorLight,
                      thickness: 4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomHero(
                          tag: 'linkedin',
                          child: LinkButton(
                            url: 'https://www.linkedin.com/in/jk-tripathy/',
                            img: 'assets/img/linkedin.png',
                            imgDim: constraints.maxWidth < mobileWidth
                                ? MediaQuery.of(context).size.width * 0.07
                                : MediaQuery.of(context).size.height * 0.06,
                          ),
                        ),
                        CustomHero(
                          tag: 'cv',
                          child: IconButton(
                            onPressed: () async {
                              var data = await rootBundle
                                  .load('assets/Tripathy_Jatin_CV.pdf');
                              final bytes = data.buffer.asUint8List();
                              final blob = html.Blob([bytes]);
                              final url =
                                  html.Url.createObjectUrlFromBlob(blob);
                              final anchor = html.document.createElement('a')
                                  as html.AnchorElement
                                ..href = url
                                ..style.display = 'none'
                                ..download = 'Tripathy_Jatin_CV.pdf';
                              html.document.body!.children.add(anchor);
                              anchor.click();
                              html.document.body!.children.remove(anchor);
                              html.Url.revokeObjectUrl(url);
                            },
                            icon: Image.asset(
                              width: constraints.maxWidth < mobileWidth
                                  ? MediaQuery.of(context).size.width * 0.07
                                  : MediaQuery.of(context).size.height * 0.06,
                              height: constraints.maxWidth < mobileWidth
                                  ? MediaQuery.of(context).size.width * 0.07
                                  : MediaQuery.of(context).size.height * 0.06,
                              fit: BoxFit.cover,
                              'assets/img/cv.png',
                            ),
                          ),
                        ),
                        CustomHero(
                          tag: 'mail',
                          child: LinkButton(
                            img: 'assets/img/mail.png',
                            imgDim: constraints.maxWidth < mobileWidth
                                ? MediaQuery.of(context).size.width * 0.07
                                : MediaQuery.of(context).size.height * 0.06,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
