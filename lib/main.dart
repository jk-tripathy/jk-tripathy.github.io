import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/details_view.dart';
import 'package:portfolio/screens/landing_page.dart';
import 'package:portfolio/screens/sections.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

CustomTransitionPage buildPageTransition(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  Map<String, dynamic>? extra = state.extra as Map<String, dynamic>? ?? {};
  String transitionType = extra['transitionType'] ?? 'rightToLeft';
  switch (transitionType) {
    case 'topToBottom':
      return CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );
    case 'rightToLeft':
      return CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );
    default:
      return CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const LandingPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'sections',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageTransition(
            context,
            state,
            const Sections(),
          ),
        ),
        GoRoute(
          path: 'about',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsView(tag: 'about');
          },
        ),
        GoRoute(
          path: 'projects',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsView(tag: 'projects');
          },
        ),
        GoRoute(
          path: 'work',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsView(tag: 'work');
          },
        ),
        GoRoute(
          path: 'papers',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsView(tag: 'papers');
          },
        ),
        GoRoute(
          path: 'contact',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsView(tag: 'contact');
          },
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
