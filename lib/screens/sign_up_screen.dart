import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/screens/sign_in_screen.dart';
import 'package:breast_onco/screens/sign_up_one_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/sign_in_sign_up_prompt_widget.dart';
import 'package:breast_onco/widgets/on_board_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:breast_onco/screens/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await firebaseAuth.signInWithCredential(credential).then(
              (value) => Navigator.pushNamedAndRemoveUntil(context, TabsScreen.routeName, (route) => false),
            );
      }
    } catch (e) {
      flutterToast('An Error Occurred During Authentication');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/logo-purple.png',
                    height: 280,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                  child: Text(
                    'Create an account withone of the options below!',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: kTextColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    OnBoardListTileWidget(
                      text: 'Sign up with Email',
                      image: 'assets/images/email-icon.svg',
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUpOneScreen.routeName);
                      },
                    ),
                  ],
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
