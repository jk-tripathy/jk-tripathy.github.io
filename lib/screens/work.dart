import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/data/work_list.dart';
import 'package:portfolio/widgets/custom_hero.dart';
import 'package:portfolio/widgets/page_indicator.dart';
import 'package:portfolio/widgets/top_bar.dart';
import 'package:flutter/foundation.dart';

class WorkView extends StatefulWidget {
  WorkView({super.key});

  @override
  State<WorkView> createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: work_list.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

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
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.85,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        CustomHero(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: constraints.maxWidth < mobileWidth
                                ? MediaQuery.of(context).size.height * 0.65
                                : MediaQuery.of(context).size.height * 0.60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColorLight,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: constraints.maxWidth < mobileWidth
                              ? MediaQuery.of(context).size.height * 0.65
                              : MediaQuery.of(context).size.height * 0.60,
                          child: PageView(
                            controller: _pageViewController,
                            onPageChanged: _handlePageViewChanged,
                            children: PageViewContent(context, constraints),
                          ),
                        ),
                      ],
                    ),
                    PageIndicator(
                      tabController: _tabController,
                      currentPageIndex: _currentPageIndex,
                      onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                      isOnDesktopAndWeb: _isOnDesktopAndWeb,
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> PageViewContent(
      BuildContext context, BoxConstraints constraints) {
    return work_list.map((work) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      work['title']!,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).primaryColorLight,
                              ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  constraints.maxWidth < mobileWidth
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "at ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Theme.of(context).hintColor,
                                      ),
                                ),
                                Text(
                                  work['Company']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "from ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Theme.of(context).hintColor,
                                      ),
                                ),
                                Text(
                                  work['duration']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "at ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                            ),
                            Text(
                              work['Company']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "from ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                            ),
                            Text(
                              work['duration']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                            ),
                          ],
                        )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...work['content']!.map<Widget>((content) {
                    return Text(
                      "• $content",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).primaryColorLight,
                          ),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
