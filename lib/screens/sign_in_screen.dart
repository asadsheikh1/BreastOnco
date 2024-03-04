import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/constants/repository.dart';
import 'package:breast_onco/screens/sign_up_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/sign_in_sign_up_prompt_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  Repository apis = Repository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordObscure = true;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 32.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/images/logo-purple.png',
                          scale: 3,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: Text(
                          'Login in with your credentials below',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: kTextColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0, bottom: 8.0),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is wrong!';
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            labelText: 'Enter password',
                            floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                            hintStyle: TextStyle(color: kTextColor),
                            labelStyle: TextStyle(color: kTextColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObscure = !passwordObscure;
                                });
                              },
                              icon: Icon(passwordObscure ? Icons.visibility_off : Icons.visibility, color: kSecondarySwatchColor),
                            ),
                          ),
                          obscureText: passwordObscure,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        child: SizedBox(
                          width: size(context).width,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  apis.login(context, emailController.text, passwordController.text);
                                  setState(() {
                                    showSpinner = false;
                                  });
                                }
                              } catch (e) {
                                flutterToast(e.toString());
                              }
                            },
                            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                  backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
                                ),
                            child: Text(
                              'Login',
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
                  const SignInSignUpPromptWidget(text1: 'Join the new way to your health!', text2: 'Sign Up', routeName: SignUpScreen.routeName),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
