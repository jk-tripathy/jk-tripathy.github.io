import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/widgets/circle_outline_container.dart';
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
                height: MediaQuery.of(context).size.height * 0.91,
                child: Center(
                  child: LayoutBuilder(builder: (context, constraints) {
                    List<Widget> widgetList = [
                      GestureDetector(
                        onTap: () {},
                        child: const CircleOutlineContainer(
                          text: 'FUCK',
                        ),
                      ),
                      Container(
                        height: 15,
                        width: 15,
                        color: Theme.of(context).shadowColor,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleOutlineContainer(
                          text: 'FUCK',
                        ),
                      ),
                      Container(
                        height: 15,
                        width: 15,
                        color: Theme.of(context).shadowColor,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleOutlineContainer(
                          text: 'FUCK',
                        ),
                      ),
                      Container(
                        height: 15,
                        width: 15,
                        color: Theme.of(context).shadowColor,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleOutlineContainer(
                          text: 'FUCK',
                        ),
                      ),
                    ];
                    if (constraints.maxWidth < mobileWidth) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: widgetList,
                      );
                    } else {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: widgetList,
                      );
                    }
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
