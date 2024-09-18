import 'dart:html' as html;
import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final String? url;
  final String img;
  final double imgDim;
  const LinkButton(
      {super.key, this.url, required this.img, required this.imgDim});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async => url != null
          ? html.window.open(url!, "_blank")
          : throw Exception('Could not launch'),
      icon: Image.asset(
        width: imgDim,
        height: imgDim,
        fit: BoxFit.cover,
        img,
      ),
    );
  }
}
