import 'package:flutter/material.dart';
import 'package:portfolio/widgets/responsive_ui.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: const ResponsiveUI(),
      ),
    );
  }
}
