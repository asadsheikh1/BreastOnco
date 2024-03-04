import 'dart:math';

import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
String? id;

final List<String> questions = [
  "Are you positive Family Hx for Breast CA?",
  "Have you ever been diagnosed with breast cancer before?",
  "Do you have a family history of breast cancer, particularly in a first-degree relative (such as a mother)?",
  "Have you ever had abnormal breast biopsies or other breast conditions?",
  "Have you ever undergone radiation therapy to the chest area?",
  "Have you ever taken hormone replacement therapy or oral contraceptives?",
  "Did you start menstruating before 12?",
  "Have you ever been pregnant?",
  "Do you consume alcohol, and if so, how many drinks per week on average?",
  "Are you physically active on a regular basis?",
  "Have you been exposed to environmental pollutants, such as pesticides or chemicals used in plastics?",
  "Are you a working woman? Which sector do you belong to?",
  "Do you shield yourself in that environment?",
  "Does any bloody fluid leak from the nipple?",
  "Is there a lump in the breast or underarm?",
  "Is there any dimpling of skin in the breast?",
  "Is there any change in your nipple position, i.e., pushed inside or pulled away from the center?",
  "Does your skin change, such as redness or swelling that does not go away?",
  "Have you experienced a recent change in the size or shape of the breast?",
  "Do you have new pain at a specific point in that breast that does not go away?",
  "Is there redness or flaky skin in the nipple area of the breast?",
  "Do you have any constant backache that is increasing with the passage of time? Have you suffered any bone fractures recently after trivial injury that is non-healing?",
  "Are you recently suffering from shortness of breath, difficulty breathing, non-settling cough by any medications, chest wall pain, or extreme fatigue?",
  "Do you feel nauseated, extremely fatigued, increased abdominal girth, swelling in feet and hands, or itchy skin?",
  "Do you suffer from a recent onset of constant headaches, blurred or double vision, difficulty with speech, difficulty with movements, or seizures?",
  "Does ultrasound report it as well circumscribed, round to oval or macrolobulated mass with uniform hypoechogenicity?",
  "Is the lump painful during your monthly cycles and go away as your cycle ends?",
];

int modelClassifier() {
  Random random = Random();
  int randomNumber = random.nextInt(2);
  return randomNumber;
}

void cacheData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  id = pref.getString("user_id");
}

String diagnoseTumor(String value) {
  if (value == "1") {
    return "Malignant";
  } else if (value == "0") {
    return "Benign";
  } else {
    return "Invalid value";
  }
}

Size size(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return size;
}

Future<bool?> flutterToast(value) {
  return Fluttertoast.showToast(
    msg: value,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: kTextColor,
    textColor: kLightColor,
    fontSize: 16.0,
  );
}
