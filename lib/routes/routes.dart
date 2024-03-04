import 'package:breast_onco/screens/account_screen.dart';
import 'package:breast_onco/screens/courses_screen.dart';
import 'package:breast_onco/screens/home_screen.dart';
import 'package:breast_onco/screens/edit_patient_details_screen.dart';
import 'package:breast_onco/screens/goals_screen.dart';
import 'package:breast_onco/screens/onboard_review_order_two_screen.dart';
import 'package:breast_onco/screens/otp_verification_screen.dart';
import 'package:breast_onco/screens/result_screen.dart';
import 'package:breast_onco/screens/sign_in_screen.dart';
import 'package:breast_onco/screens/sign_up_one_screen.dart';
import 'package:breast_onco/screens/sign_up_screen.dart';
import 'package:breast_onco/screens/sign_up_verify_password_screen.dart';
import 'package:breast_onco/screens/splash_screen.dart';
import 'package:breast_onco/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  Map<String, WidgetBuilder> routes() {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      OnboardReviewOrderTwoScreen.routeName: (context) => const OnboardReviewOrderTwoScreen(),
      TabsScreen.routeName: (context) => const TabsScreen(),
      SignInScreen.routeName: (context) => const SignInScreen(),
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      SignUpOneScreen.routeName: (context) => const SignUpOneScreen(),
      SignUpVerifyPasswordScreen.routeName: (context) => const SignUpVerifyPasswordScreen(),
      OtpVerificationScreen.routeName: (context) => const OtpVerificationScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      GoalsScreen.routeName: (context) => const GoalsScreen(),
      CoursesScreen.routeName: (context) => const CoursesScreen(),
      AccountScreen.routeName: (context) => const AccountScreen(),
      EditPatientDetailsScreen.routeName: (context) => const EditPatientDetailsScreen(),
      ResultScreen.routeName: (context) => const ResultScreen(),
    };
  }
}
