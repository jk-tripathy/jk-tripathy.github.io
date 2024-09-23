import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/widgets/custom_hero.dart';
import 'package:portfolio/widgets/top_bar.dart';
import 'package:flutter/foundation.dart';

class ProjectsView extends StatefulWidget {
  ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView>
    with TickerProviderStateMixin {
  late final List<Map<String, String>> research_projects;
  late final List<Map<String, String>> swe_projects;
  late PageController _pageViewController;
  late TabController _tabController;

  int _currentProjectIndex = 0;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    research_projects = project_list['Research']!;
    swe_projects = project_list['SWE']!;
    _pageViewController = PageController();
    _tabController =
        TabController(length: research_projects.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _currentProjectIndex = 0;
                              _pageViewController.jumpToPage(0);
                              _tabController = TabController(
                                  length: research_projects.length,
                                  vsync: this);
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _currentProjectIndex == 0
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).primaryColorLight,
                            backgroundColor: _currentProjectIndex == 0
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark,
                          ),
                          child: const Text('Research'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _currentProjectIndex = 1;
                              _pageViewController.jumpToPage(0);
                              _tabController = TabController(
                                  length: swe_projects.length, vsync: this);
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _currentProjectIndex == 1
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).primaryColorLight,
                            backgroundColor: _currentProjectIndex == 1
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark,
                          ),
                          child: const Text('SWE'),
                        ),
                      ],
                    ),
                    CustomHero(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
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
                          child: PageView(
                              controller: _pageViewController,
                              onPageChanged: _handlePageViewChanged,
                              children: [
                                if (_currentProjectIndex == 0)
                                  ...research_projects.map((project) {
                                    return Center(
                                      child: Text(project['title']!),
                                    );
                                  }),
                                if (_currentProjectIndex == 1)
                                  ...swe_projects.map((project) {
                                    return Center(
                                      child: Text(project['title']!),
                                    );
                                  }),
                              ]),
                        ),
                      ),
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

  List<Widget> PageViewContent(BuildContext context) {
    if (_currentProjectIndex == 0) {
      return research_projects.map((project) {
        return Center(
          child: Text(project['title']!),
        );
      }).toList();
    } else if (_currentProjectIndex == 1) {
      return swe_projects.map((project) {
        return Center(
          child: Text(project['title']!),
        );
      }).toList();
    }
    return [];
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
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: Icon(
              Icons.arrow_left_rounded,
              size: 64.0,
              color: Theme.of(context).hintColor,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            indicatorSize: 16.0,
            color: Theme.of(context).primaryColorLight,
            selectedColor: Theme.of(context).hintColor,
            borderStyle: BorderStyle.none,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 2) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: Icon(
              Icons.arrow_right_rounded,
              size: 64.0,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
