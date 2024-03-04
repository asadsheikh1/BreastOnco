import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/screens/select_image_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/circular_progress_indicator_rabbit_widget.dart';
import 'package:breast_onco/widgets/onboard_bookmark_widget.dart';
import 'package:flutter/material.dart';

class QuestionAndAnswerScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String phone;

  const QuestionAndAnswerScreen({Key? key, required this.firstName, required this.lastName, required this.age, required this.phone}) : super(key: key);

  @override
  State<QuestionAndAnswerScreen> createState() => _QuestionAndAnswerScreenState();
}

class _QuestionAndAnswerScreenState extends State<QuestionAndAnswerScreen> {
  Map<int, int> answers = {};

  bool checkIsEmpty() {
    return answers.length == questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
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
                  OnboardBookmarkWidget(text: 'Question & Answer'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Q${index + 1}. ${questions[index]}'),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: answers[index],
                                onChanged: (value) {
                                  setState(() {
                                    answers[index] = value!;
                                  });
                                },
                              ),
                              const Text('Strongly Agree'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: answers[index],
                                onChanged: (value) {
                                  setState(() {
                                    answers[index] = value!;
                                  });
                                },
                              ),
                              const Text('Agree'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 3,
                                groupValue: answers[index],
                                onChanged: (value) {
                                  setState(() {
                                    answers[index] = value!;
                                  });
                                },
                              ),
                              const Text('Disagree'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 4,
                                groupValue: answers[index],
                                onChanged: (value) {
                                  setState(() {
                                    answers[index] = value!;
                                  });
                                },
                              ),
                              const Text('Strongly Disagree'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
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
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: checkIsEmpty()
                            ? () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SelectImageScreen(
                                      firstName: widget.firstName,
                                      lastName: widget.lastName,
                                      age: widget.age,
                                      phone: widget.phone,
                                      answers: answers,
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: checkIsEmpty()
                            ? Theme.of(context).elevatedButtonTheme.style
                            : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                  backgroundColor: MaterialStateProperty.all(kTextColor.withOpacity(0.4)),
                                ),
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
      ),
    );
  }
}
