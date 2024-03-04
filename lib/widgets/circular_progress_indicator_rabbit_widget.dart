import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentIndicatorRabbitWidget extends StatelessWidget {
  final bool animation;
  final double percent;
  final int animationDuration;

  const CircularPercentIndicatorRabbitWidget({
    super.key,
    required this.animation,
    required this.percent,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      backgroundColor: kSecondarySwatchColor.shade50,
      radius: 50.0,
      lineWidth: 4.0,
      animation: animation,
      percent: percent,
      animationDuration: animationDuration,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo-purple.png',
            height: 60,
            fit: BoxFit.contain,
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: kSecondarySwatchColor,
    );
  }
}
