import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/screens/tabs_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/circular_progress_indicator_rabbit_widget.dart';
import 'package:breast_onco/widgets/heading_widget.dart';
import 'package:breast_onco/widgets/onboard_bookmark_widget.dart';
import 'package:flutter/material.dart';
import 'package:breast_onco/constants/repository.dart';
import 'package:firebase_database/firebase_database.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
                    OnboardBookmarkWidget(text: 'Prediction'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: HeadingWidget(
                    heading: 'Breast Cancer Prediction',
                  ),
                ),
                StreamBuilder(
                  stream: Repository.databasePatient.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    } else {
                      if (snapshot.data!.snapshot.value != null) {
                        Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
                        List<dynamic> sStream = [];
                        sStream.clear();
                        sStream = map.values.toList();

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 32.0, // Adjust width
                                child: Text(
                                  'Questionnaire Result',
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                        color: kSecondarySwatchColor,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 32.0, // Adjust width
                                child: Text(
                                  'Patient might have ${diagnoseTumor(sStream[sStream.length - 1]['questionnairePrediction'].toString())}. Please consult with a medical professional.',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 32.0, // Adjust width
                                child: Text(
                                  'Mammogram Result',
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                        color: kSecondarySwatchColor,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 32.0, // Adjust width
                                child: Text(
                                  'Patient might have ${diagnoseTumor(sStream[sStream.length - 1]['cnnPrediction'].toString())}. Please consult with a medical professional.',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(TabsScreen.routeName, (Route route) => false);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      'Go to Dashboard',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kLightColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                        side: MaterialStateProperty.all(BorderSide(color: kSecondarySwatchColor)),
                      ),
                  child: Text(
                    'Back',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: kSecondarySwatchColor,
                          fontWeight: FontWeight.bold,
                        ),
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
