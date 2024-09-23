import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/contact.dart';
import 'package:portfolio/screens/details_view.dart';
import 'package:portfolio/screens/landing_page.dart';
import 'package:portfolio/screens/home.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/screens/papers.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/work.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

CustomTransitionPage buildPageTransition(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 750),
    reverseTransitionDuration: const Duration(milliseconds: 750),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const LandingPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageTransition(
            context,
            state,
            const HomePage(),
          ),
        ),
        GoRoute(
          path: 'about',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageTransition(
            context,
            state,
            const AboutView(),
          ),
        ),
        GoRoute(
          path: 'projects',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageTransition(
            context,
            state,
            const ProjectsView(),
          ),
        ),
        GoRoute(
          path: 'work',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageTransition(
            context,
            state,
            const WorkView(),
          ),
        ),
        GoRoute(
          path: 'papers',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageTransition(
            context,
            state,
            const PapersView(),
          ),
        ),
        GoRoute(
          path: 'contact',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageTransition(
            context,
            state,
            const ContactView(),
          ),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "JKT's Portfolio",
      theme: ThemeData(
        primaryColorDark: const Color(0xFF2B2D42),
        primaryColorLight: const Color(0xFFEDF2F4),
        shadowColor: const Color(0xFFB7BFCC),
        hintColor: const Color(0xFFEF233C),
        focusColor: const Color(0xFFD90429),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.075,
              MediaQuery.of(context).size.width * 0.075,
            ),
            fontWeight: FontWeight.w900,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.045,
              MediaQuery.of(context).size.width * 0.045,
            ),
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.03,
              MediaQuery.of(context).size.width * 0.035,
            ),
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.025,
              MediaQuery.of(context).size.width * 0.03,
            ),
            fontWeight: FontWeight.w400,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.02,
              MediaQuery.of(context).size.width * 0.03,
            ),
            fontWeight: FontWeight.w600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(
                fontFamily: 'Nunito',
                fontSize: min(
                  MediaQuery.of(context).size.height * 0.035,
                  MediaQuery.of(context).size.width * 0.04,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(
                fontFamily: 'Nunito',
                fontSize: min(
                  MediaQuery.of(context).size.height * 0.03,
                  MediaQuery.of(context).size.width * 0.035,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      // home: const LandingPage(),
      routerConfig: _router,
    );
  }
}
