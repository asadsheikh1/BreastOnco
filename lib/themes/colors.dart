import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xff8AB428);
MaterialColor kPrimarySwatchColor = MaterialColor(
  kPrimaryColor.value,
  <int, Color>{
    50: const Color(0xffF3F8EA),
    100: const Color(0xffDCE9BF),
    200: const Color(0xffD0E1A9),
    300: const Color(0xffB9D27E),
    400: const Color(0xffA1C353),
    500: kPrimaryColor,
    600: const Color(0xff617E1C),
    700: const Color(0xff536C18),
    800: const Color(0xff374810),
    900: const Color(0xff29360C),
    1000: const Color(0xff1C2408),
  },
);

Color kSecondaryColor = const Color(0xff3d0763);
MaterialColor kSecondarySwatchColor = MaterialColor(
  kSecondaryColor.value,
  <int, Color>{
    50: const Color(0xffE9F4F9),
    100: const Color(0xffD4E8F3),
    200: const Color(0xffA8D2E7),
    300: const Color(0xff93C7E1),
    400: const Color(0xff67B0D4),
    500: kSecondaryColor,
    600: const Color(0xff2280AF),
    700: const Color(0xff1B6388),
    800: const Color(0xff175574),
    900: const Color(0xff0F394E),
    1000: const Color(0xff081C27),
  },
);

Color kLightColor = const Color(0xffffffff);
Color kDarkColor = const Color(0xff1E1F23);
Color kTransparentColor = Colors.transparent;
Color kTextColor = const Color(0xff6a6c74);
Color kPurpleColor = const Color(0xff6762A6);
Color kPinkColor = const Color(0xffEA4C89);
