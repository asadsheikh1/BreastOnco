import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/screens/sign_in_screen.dart';
import 'package:breast_onco/screens/tabs_screen.dart';
import 'package:breast_onco/utils/cache.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? uncachedEmail;

class Repository {
  static final auth = FirebaseAuth.instance;
  static final databaseUser = FirebaseDatabase.instance.ref('user');
  static final databasePatient = FirebaseDatabase.instance.ref('patient');

  userAuth({
    required BuildContext context,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Repository.auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      pref.setString('email', email);
      UserCacheData.getCacheData();
      Repository.databaseUser.onValue.listen((event) {
        for (var child in event.snapshot.children) {
          if (child.child('email').value.toString() == UserCacheData.userEmail.toString()) {
            pref.setString('user_id', child.key.toString());
            UserCacheData.getCacheData();
          }
        }
      });
      setUserData(
        context: context,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        password: password,
      );
    }).onError((error, stackTrace) {
      String errorMessage = 'An Error Occurred During Authentication';

      if (error is FirebaseAuthException) {
        errorMessage = getFirebaseAuthErrorMessage(error, context);
      }

      flutterToast(errorMessage);
    });
  }

  void login(BuildContext context, String inputEmail, String inputPassword) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Repository.auth.signInWithEmailAndPassword(email: inputEmail.toLowerCase(), password: inputPassword).then((value) {
      pref.setString('email', inputEmail);
      UserCacheData.getCacheData();
      Repository.databaseUser.onValue.listen((event) {
        for (var child in event.snapshot.children) {
          if (child.child('email').value.toString() == UserCacheData.userEmail.toString()) {
            pref.setString('user_id', child.key.toString());
            UserCacheData.getCacheData();
          }
        }
      });

      Navigator.pushNamedAndRemoveUntil(context, TabsScreen.routeName, (route) => false);

      flutterToast('${'Successfull login as'} ${value.user!.email.toString()}');
    }).catchError((error) {
      String errorMessage = 'An Error Occurred During Authentication';

      if (error is FirebaseAuthException) {
        errorMessage = getFirebaseAuthErrorMessage(error, context);
      }

      flutterToast(errorMessage);
    });
  }

  String getFirebaseAuthErrorMessage(FirebaseAuthException exception, BuildContext context) {
    String errorMessage = 'An Error Occurred During Authentication';

    switch (exception.code) {
      case 'invalid-email':
        errorMessage = 'The Email Address Is Not Valid';
        break;
      case 'user-disabled':
        errorMessage = 'The User Has Been Disabled';
        break;
      case 'user-not-found':
        errorMessage = 'There Is No User Record Corresponding To This Identifier';
        break;
      case 'wrong-password':
        errorMessage = 'The Password Is Incorrect';
        break;
      case 'email-already-in-use':
        errorMessage = 'The Email Address Is Already In Use By Another Account';
        break;
      case 'operation-not-allowed':
        errorMessage = 'The Operation Is Not Allowed';
        break;
      case 'weak-password':
        errorMessage = 'The Password Is Too Weak';
        break;
      default:
        errorMessage = 'An Error Occurred During Authentication';
    }

    return errorMessage;
  }

  static logout(BuildContext context) async {
    auth.signOut().then(
      (value) async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.clear().then((value) {
          UserCacheData.getCacheData();
          Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName, (route) => false);

          flutterToast('Logged Out');
        });
      },
    );
  }

  static setUserData({
    required BuildContext context,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
  }) {
    databaseUser.child('${DateTime.now().millisecondsSinceEpoch}').set({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'password': password,
    }).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
        (route) => false,
      );
      flutterToast('Account Created Successfully').onError((error, stackTrace) {
        return flutterToast('Sorry An Error Occurred');
      });
    });
  }

  static updateUserDataWithoutImage({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required List<String> interests,
    required String countryCode,
    required String phone,
    required String countryISOCode,
  }) {
    databaseUser.child('${UserCacheData.userId}').set({
      'email': UserCacheData.userEmail,
      'first_name': firstName,
      'last_name': lastName,
      'interests': interests,
      'countryCode': countryCode,
      'phone': phone,
      'countryISOCode': countryISOCode,
    }).then((value) {
      flutterToast('Account Updated Successfully').onError((error, stackTrace) {
        return flutterToast('Sorry An Error Occurred');
      });
    });
  }

  static setPatientData({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String age,
    required String phone,
    required Map<int, int> answers,
    required String imageUrl,
    required String cnnPrediction,
    required String questionnairePrediction,
  }) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    databasePatient.child(id).set({
      'id': id,
      'email': UserCacheData.userEmail,
      'firstName': firstName,
      'last_name': lastName,
      'age': age,
      'phone': phone,
      'answers': answers,
      'imageUrl': imageUrl,
      'cnnPrediction': cnnPrediction,
      'questionnairePrediction': questionnairePrediction,
    }).then((value) {
      flutterToast('Patient has been created');
    }).onError((error, stackTrace) {
      flutterToast('Sorry An Error Occurred');
    });
  }

  static deletePatientData({
    required BuildContext context,
    required String id,
  }) {
    databasePatient.child(id).remove().then((value) {
      flutterToast('Patient has been deleted');
    }).onError((error, stackTrace) {
      flutterToast('Sorry An Error Occurred');
    });
  }
}
