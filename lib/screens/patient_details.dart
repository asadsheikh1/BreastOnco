import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String age;
  final String phone;
  final String imageUrl;
  final List<Object?> answers;
  final String cnnPrediction;
  final String questionnairePrediction;

  const PatientDetails({Key? key, required this.firstName, required this.lastName, required this.email, required this.age, required this.phone, required this.imageUrl, required this.answers, required this.cnnPrediction, required this.questionnairePrediction, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-purple.png',
          height: 100,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Patients Details',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: kSecondarySwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  '$firstName $lastName',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: kSecondarySwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Dr. Email: $email',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'First Name: $firstName',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Last Name: $lastName',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Age: $age',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Phone: $phone',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'CNN Prediction: ${diagnoseTumor(cnnPrediction)}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Questionnaire Prediction: ${diagnoseTumor(questionnairePrediction)}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Question/ Answers',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ...questions.map((question) {
                  final index = questions.indexOf(question);
                  String answerText;
                  switch (answers[index].toString()) {
                    case "1":
                      answerText = "Strongly Agree";
                      break;
                    case "2":
                      answerText = "Agree";
                      break;
                    case "3":
                      answerText = "Disagree";
                      break;
                    case "4":
                      answerText = "Strongly Disagree";
                      break;
                    default:
                      answerText = "Unknown";
                  }
                  return ListTile(
                    title: Text('Q${index + 1}. $question'),
                    subtitle: Text('Ans. $answerText'),
                  );
                }),
                const SizedBox(height: 16.0),
                Image.network(imageUrl),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: size(context).width,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                            side: MaterialStateProperty.all(BorderSide(
                          color: kSecondarySwatchColor,
                        ))),
                    child: Text(
                      'Back',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kSecondarySwatchColor,
                            fontWeight: FontWeight.bold,
                          ),
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
