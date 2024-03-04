import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearPercentIndicatorWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color;
  final double percent;

  const LinearPercentIndicatorWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.color,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      width: size(context).width,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              LinearPercentIndicator(
                backgroundColor: kSecondarySwatchColor.shade50,
                animation: true,
                lineHeight: 25.0,
                animationDuration: 2000,
                percent: percent,
                barRadius: const Radius.circular(16),
                progressColor: color,
              ),
              Positioned(
                right: 112.0 * (percent * 10),
                child: SvgPicture.asset(
                  'assets/images/logo-blue.svg',
                  colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                  height: 18,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: Text(
                  text1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kTextColor,
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: Text(
                  text2,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kTextColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
