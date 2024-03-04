import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/screens/tabs_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/circular_progress_indicator_rabbit_widget.dart';
import 'package:breast_onco/widgets/onboard_you_did_it_widget.dart';
import 'package:flutter/material.dart';

class OnboardReviewOrderTwoScreen extends StatefulWidget {
  const OnboardReviewOrderTwoScreen({super.key});
  static const routeName = '/onboard-review-order-two';

  @override
  State<OnboardReviewOrderTwoScreen> createState() => _OnboardReviewOrderTwoScreenState();
}

class _OnboardReviewOrderTwoScreenState extends State<OnboardReviewOrderTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularPercentIndicatorRabbitWidget(
                        animation: true,
                        percent: 1.0,
                        animationDuration: 2000,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Muhammad, you\'ve signed up successfully!',
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                    color: kSecondarySwatchColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                    text: 'Welcome to the ',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: kTextColor,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'Breast Onco',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: kSecondarySwatchColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' family!',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: kTextColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: Column(
                          children: [
                            OnboardYouDidItWidget(text: 'Email set-up'),
                            OnboardYouDidItWidget(text: 'First and last name set-up'),
                            OnboardYouDidItWidget(text: 'Phone number set-up'),
                            OnboardYouDidItWidget(text: 'Password set-up'),
                            Divider(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          width: size(context).width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(TabsScreen.routeName, (Route route) => false);
                            },
                            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                  backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
                                ),
                            child: Text(
                              'Go to Dashboard',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: kLightColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
