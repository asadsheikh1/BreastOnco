import 'package:breast_onco/screens/question_and_answer_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});
  static const routeName = '/courses';

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool checkIsEmpty() {
    return firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && ageController.text.isNotEmpty && mobileController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadingWidget(heading: 'Add New Patient'),
                const SizedBox(height: 16.0),
                Text(
                  'Enter patient first name',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: TextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                      ),
                      labelText: 'First Name',
                      hintText: 'Enter First Name',
                      floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                      hintStyle: TextStyle(color: kTextColor),
                      labelStyle: TextStyle(color: kTextColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Enter patient last name',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: TextFormField(
                    controller: lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                      ),
                      labelText: 'Last Name',
                      hintText: 'Enter Last Name',
                      floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                      hintStyle: TextStyle(color: kTextColor),
                      labelStyle: TextStyle(color: kTextColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Enter patient age',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      MaskTextInputFormatter(
                        mask: '###',
                        filter: {
                          "#": RegExp(r'[0-9]')
                        },
                        type: MaskAutoCompletionType.eager,
                      ),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                      ),
                      labelText: 'Age',
                      hintText: 'Enter Age',
                      floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                      hintStyle: TextStyle(color: kTextColor),
                      labelStyle: TextStyle(color: kTextColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Enter patient mobile number',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextColor,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      MaskTextInputFormatter(
                        mask: '####-#######',
                        filter: {
                          "#": RegExp(r'[0-9]')
                        },
                        type: MaskAutoCompletionType.eager,
                      ),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                      ),
                      labelText: 'Mobile Number',
                      hintText: 'Enter Mobile Number',
                      floatingLabelStyle: TextStyle(color: kSecondarySwatchColor),
                      hintStyle: TextStyle(color: kTextColor),
                      labelStyle: TextStyle(color: kTextColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kSecondarySwatchColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: checkIsEmpty()
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QuestionAndAnswerScreen(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  age: ageController.text,
                                  phone: mobileController.text,
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
                      'Add Patient',
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
        ),
      ),
    );
  }
}
