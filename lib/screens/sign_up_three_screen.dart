import 'package:breast_onco/screens/sign_in_screen.dart';
import 'package:breast_onco/screens/sign_up_four_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/sign_in_sign_up_prompt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpThreeScreen extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;

  const SignUpThreeScreen({super.key, required this.email, required this.firstName, required this.lastName});

  @override
  State<SignUpThreeScreen> createState() => _SignUpThreeScreenState();
}

class _SignUpThreeScreenState extends State<SignUpThreeScreen> {
  TextEditingController phoneController = TextEditingController();

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
                          height: 280,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0, bottom: 8.0),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            MaskTextInputFormatter(
                              mask: '####-#######',
                              filter: {
                                "#": RegExp(r'[0-9]')
                              },
                              type: MaskAutoCompletionType.eager,
                            ),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            labelText: 'Enter mobile number',
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
                                      builder: (context) => SignUpFourScreen(
                                        email: widget.email,
                                        firstName: widget.firstName,
                                        lastName: widget.lastName,
                                        phone: phoneController.text,
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
