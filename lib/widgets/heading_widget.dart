import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String heading;

  const HeadingWidget({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: kSecondarySwatchColor,
                fontWeight: FontWeight.bold,

              ),
        ),
      ],
    );
  }
}
