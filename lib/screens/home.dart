import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/screens/landing_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < mobileWidth) {
            // MOBILE
            return Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: LandingPage(
                  textBoxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
            );
          } else {
            // DESKTOP
            return Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: LandingPage(
                  textBoxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
