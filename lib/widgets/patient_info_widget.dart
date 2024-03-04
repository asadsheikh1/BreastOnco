// PatientInfoWidget.dart

import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';

class PatientInfoWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String contactNumber;
  final String questionnaireResult;
  final String imageModelResult;

  const PatientInfoWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.contactNumber,
    required this.questionnaireResult,
    required this.imageModelResult,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Patient Information',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: kSecondarySwatchColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text('Name: $firstName $lastName', style: Theme.of(context).textTheme.bodyLarge),
        Text('Age: $age', style: Theme.of(context).textTheme.bodyLarge),
        Text('Contact Number: $contactNumber', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text('Questionnaire Result: $questionnaireResult', style: Theme.of(context).textTheme.bodyLarge),
        Text('Image Model Result: $imageModelResult', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
      ],
    );
  }
}
