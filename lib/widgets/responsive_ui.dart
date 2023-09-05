import 'package:flutter/material.dart';
import 'package:portfolio/data/dimensions.dart';

class ResponsiveUI extends StatelessWidget {
  const ResponsiveUI({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return Container(
          color: Colors.red,
        );
      } else {
        return Container(
          color: Colors.yellow,
        );
      }
    });
  }
}
