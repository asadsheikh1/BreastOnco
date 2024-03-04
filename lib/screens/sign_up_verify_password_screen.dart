import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpVerifyPasswordScreen extends StatefulWidget {
  const SignUpVerifyPasswordScreen({super.key});
  static const routeName = '/sign-up-verify-password';

  @override
  State<SignUpVerifyPasswordScreen> createState() => _SignUpVerifyPasswordScreenState();
}

class _SignUpVerifyPasswordScreenState extends State<SignUpVerifyPasswordScreen> {
  bool resendClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 40.0,
                    right: -20.0,
                    child: SvgPicture.asset(
                      'assets/images/curved-email-icon.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/logo-blue.svg',
                    colorFilter: ColorFilter.mode(kSecondarySwatchColor.shade800, BlendMode.srcATop),
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                'assets/images/dashce.svg',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
              child: Text(
                'Confirm your email',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
              child: Text(
                'Please check your inbox for a confirmation email. Click the link in the email to confirm your email address.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: kTextColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    resendClicked = true;
                  });
                },
                style: Theme.of(context).outlinedButtonTheme.style,
                child: Text(
                  'Re-send confirmation email',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kPrimarySwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            resendClicked
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16.0),
                      SvgPicture.asset(
                        'assets/images/curly-down-arrow.svg',
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                        child: Text(
                          'We\'ve resent your confirmation email to terrie.smith@gmail.com',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: kTextColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
