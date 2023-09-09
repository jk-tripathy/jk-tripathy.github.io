import 'package:flutter/material.dart';

class CircleOutlineContainer extends StatelessWidget {
  final double size;
  final String text;
  const CircleOutlineContainer({
    super.key,
    required this.text,
    this.size = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Container(
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
        )
      ],
    );
  }
}
