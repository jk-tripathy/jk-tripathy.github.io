import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class BottomWave extends StatelessWidget {
  const BottomWave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [
              Theme.of(context).focusColor.withOpacity(0.35),
              Theme.of(context).focusColor.withOpacity(0.5),
            ],
            [
              Theme.of(context).focusColor.withOpacity(0.35),
              Theme.of(context).focusColor.withOpacity(0.5),
            ],
            [
              Theme.of(context).focusColor.withOpacity(0.35),
              Theme.of(context).focusColor.withOpacity(0.5),
            ],
          ],
          durations: [7000, 12000, 17000],
          heightPercentages: [0.85, 0.86, 0.85],
        ),
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 5,
      ),
    );
  }
}
