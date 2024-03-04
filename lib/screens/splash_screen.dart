import 'dart:async';

import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/screens/sign_up_screen.dart';
import 'package:breast_onco/screens/tabs_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    UserCacheData.userEmail = pref.getString('email');

    UserCacheData.userEmail == null
        ? Timer(
            const Duration(seconds: 1),
            () => Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.routeName, (route) => false),
          )
        : Timer(
            const Duration(seconds: 1),
            () => Navigator.pushNamedAndRemoveUntil(context, TabsScreen.routeName, (route) => false),
          );
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: size(context).height,
        width: size(context).width,
        color: kSecondarySwatchColor,
        child: Transform.scale(
          scale: 0.5,
          child: Image.asset(
            'assets/images/logo-white.png',
            // color: kLightColor,
          ),
        ),
      ),
    );
  }
}
