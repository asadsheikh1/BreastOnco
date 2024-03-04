import 'package:breast_onco/screens/sign_in_screen.dart';
import 'package:breast_onco/screens/sign_up_two_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/sign_in_sign_up_prompt_widget.dart';
import 'package:flutter/material.dart';

class SignUpOneScreen extends StatefulWidget {
  const SignUpOneScreen({super.key});
  static const routeName = '/sign-up-one';

  @override
  State<SignUpOneScreen> createState() => _SignUpOneScreenState();
}

class _SignUpOneScreenState extends State<SignUpOneScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
            child: Form(
              key: formKey,
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
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'SignUp with Email',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: kTextColor,
                                  // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        // ConstrainedBox(
                        // constraints: BoxConstraints(minHeight: size(context).height * 0.1),
                        // child:
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                                return 'Use the standard username format like example@breastonco.com';
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: kTextColor, width: 1.0),
                              ),
                              labelText: 'Email Address',
                              hintText: 'example@breastonco.com',
                              floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                              hintStyle: TextStyle(color: kTextColor),
                              labelStyle: TextStyle(color: kTextColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                              ),
                            ),
                          ),
                        ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                                    if (formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SignUpTwoScreen(email: emailController.text),
                                        ),
                                      );
                                    }
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
      ),
    );
  }
}
