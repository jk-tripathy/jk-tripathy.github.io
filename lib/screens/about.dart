import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/top_bar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopBar(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < mobileWidth) {
                  return MobileView(context);
                } else {
                  return DesktopView(context);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Column MobileView(BuildContext context) {
    List<Widget> widgetList = [];
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
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
      Hero(
        tag: 'hero',
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
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.height * 0.60,
        child: Center(
          child: Text(
            "I am a software engineer with a passion for creating and developing software applications as well as research. I have experience in developing web applications, mobile applications, and desktop applications. I am proficient in a variety of programming languages and frameworks. I am a quick learner and a team player. I am always looking for new challenges and opportunities to grow.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
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
