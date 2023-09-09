import 'package:flutter/material.dart';
import 'package:portfolio/screens/details_view.dart';

class CircleOutlineContainer extends StatelessWidget {
  final double size;
  final String text;
  final String tag;
  const CircleOutlineContainer({
    super.key,
    required this.text,
    required this.tag,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).hintColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  reverseTransitionDuration: const Duration(milliseconds: 600),
                  pageBuilder: (_, __, ___) => DetailsView(
                    tag: tag,
                  ),
                ),
              );
            },
            icon: Container(
              width: size - 15,
              height: size - 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColorLight,
              ),
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).primaryColorDark,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
