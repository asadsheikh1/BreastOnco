import 'package:breast_onco/screens/sign_in_screen.dart';
import 'package:breast_onco/screens/sign_up_three_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/sign_in_sign_up_prompt_widget.dart';
import 'package:flutter/material.dart';

class SignUpTwoScreen extends StatefulWidget {
  final String email;

  const SignUpTwoScreen({super.key, required this.email});
  static const routeName = '/sign-up-two';

  @override
  State<SignUpTwoScreen> createState() => _SignUpTwoScreenState();
}

class _SignUpTwoScreenState extends State<SignUpTwoScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 32.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/images/logo-purple.png',
                          // color: kSecondarySwatchColor,
                          height: 280,
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child:Text(
                      //     'Enter your full name',
                      //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      //       color: kTextColor,
                      //       // fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0, bottom: 8.0),
                        child: TextFormField(
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            labelText: 'First Name',
                            hintText: 'Enter First Name',
                            floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                            hintStyle: TextStyle(color: kTextColor),
                            labelStyle: TextStyle(color: kTextColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            labelText: 'Last Name',
                            hintText: 'Enter Last Name',
                            floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                            hintStyle: TextStyle(color: kTextColor),
                            labelStyle: TextStyle(color: kTextColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                                      side: MaterialStateProperty.all(BorderSide(color: kSecondarySwatchColor)),
                                    ),
                                child: Text(
                                  'Back',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: kSecondarySwatchColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignUpThreeScreen(
                                        email: widget.email,
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                      ),
                                    ),
                                  );
                                },
                                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                      backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
                                    ),
                                child: Text(
                                  'Next',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: kLightColor,
                                        fontWeight: FontWeight.bold,
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
                const SignInSignUpPromptWidget(text1: 'Already have an account?', text2: 'Sign In', routeName: SignInScreen.routeName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
