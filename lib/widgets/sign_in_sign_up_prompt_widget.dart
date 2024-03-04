import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';

class SignInSignUpPromptWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String routeName;

  const SignInSignUpPromptWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: kTextColor,
              ),
          textAlign: TextAlign.center,
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed(routeName);
          },
          visualDensity: VisualDensity.compact,
          child: Text(
            text2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kSecondarySwatchColor,
                ),
          ),
        ),
      ],
    );
  }
}
