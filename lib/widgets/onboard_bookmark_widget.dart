import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardBookmarkWidget extends StatefulWidget {
  final String text;

  const OnboardBookmarkWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  OnboardBookmarkWidgetState createState() => OnboardBookmarkWidgetState();
}

class OnboardBookmarkWidgetState extends State<OnboardBookmarkWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: kLightColor,
          border: Border.all(color: kSecondarySwatchColor),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/checkmark-circle.svg',
              colorFilter: ColorFilter.mode(kSecondarySwatchColor, BlendMode.srcATop),
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: FittedBox(
                child: Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kDarkColor,
                      ),
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
