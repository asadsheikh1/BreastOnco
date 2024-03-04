import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardYouDidItWidget extends StatelessWidget {
  final String text;

  const OnboardYouDidItWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/checkmark-circle.svg',
            colorFilter: ColorFilter.mode(kSecondarySwatchColor, BlendMode.srcATop),
            height: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: kTextColor,
                ),
          ),
        ],
      ),
    );
  }
}
