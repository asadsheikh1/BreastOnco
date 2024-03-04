import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/circular_progress_indicator_rabbit_widget.dart';
import 'package:breast_onco/widgets/onboard_bookmark_widget.dart';
import 'package:flutter/material.dart';

class EditPatientDetailsScreen extends StatefulWidget {
  const EditPatientDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-patient-details';

  @override
  State<EditPatientDetailsScreen> createState() => _EditPatientDetailsScreenState();
}

class _EditPatientDetailsScreenState extends State<EditPatientDetailsScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularPercentIndicatorRabbitWidget(
                        animation: true,
                        percent: 1.0,
                        animationDuration: 2000,
                      ),
                    ),
                    OnboardBookmarkWidget(text: 'Edit Details'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                        ),
                      ),
                      TextFormField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                      TextFormField(
                        controller: ageController,
                        decoration: const InputDecoration(
                          labelText: 'Age',
                        ),
                      ),
                      TextFormField(
                        controller: contactNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Contact Number',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                                      side: MaterialStateProperty.all<BorderSide>(BorderSide(color: kSecondarySwatchColor)),
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
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successful')));
                                },
                                style: Theme.of(context).elevatedButtonTheme.style,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
