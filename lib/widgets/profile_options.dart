import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';

class ProfileOptions extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOptions({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size(context).width,
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: kSecondarySwatchColor,
          ),
          child: Center(
            child: ListTile(
              leading: Icon(icon, color: kLightColor),
              title: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kLightColor),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: kLightColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
