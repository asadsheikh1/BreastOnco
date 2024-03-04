import 'dart:io';
import 'package:breast_onco/constants/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:breast_onco/constants/component.dart';
import 'package:breast_onco/constants/repository.dart';
import 'package:breast_onco/screens/result_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/widgets/circular_progress_indicator_rabbit_widget.dart';
import 'package:breast_onco/widgets/onboard_bookmark_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SelectImageScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String phone;
  final Map<int, int> answers;

  const SelectImageScreen({Key? key, required this.firstName, required this.lastName, required this.age, required this.phone, required this.answers}) : super(key: key);

  @override
  State<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  File? image;
  final picker = ImagePicker();
  bool showSpinner = false;

  bool checkIsEmpty() {
    return image != null;
  }

  int fetchData(path) {
    final response = Api().baseApi + image.toString();
    if (kDebugMode) {
      print(response);
    }

    return modelClassifier();
  }

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        flutterToast('No file selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: GestureDetector(
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
                      OnboardBookmarkWidget(text: 'Select Image'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Select Mammogram Image(JPG, PNG) or DICOM Image',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Upload Image',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: Text(
                      'This image servee as a preview or visual representation of a video',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: kTextColor),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        getImageGallery();
                      },
                      icon: Icon(Icons.image, color: kSecondarySwatchColor),
                    ),
                  ),
                  image != null
                      ? ClipRect(
                          child: Image.file(
                            image!.absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(color: kSecondarySwatchColor.shade50),
                          height: 100,
                          width: 100,
                          child: Icon(
                            Icons.image,
                            color: kLightColor,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                            onPressed: checkIsEmpty()
                                ? () async {
                                    int cnnPrediction = fetchData(image.toString());
                                    int questionnairePrediction = fetchData(image.toString());
                                    if (image != null) {
                                      setState(() {
                                        showSpinner = true;
                                      });

                                      try {
                                        int date = DateTime.now().millisecondsSinceEpoch;
                                        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/images/$date.jpeg');
                                        UploadTask uploadTask = ref.putFile(image!.absolute);
                                        TaskSnapshot snapshot = await uploadTask;
                                        String imageUrl = await snapshot.ref.getDownloadURL();

                                        Repository.setPatientData(
                                          context: context,
                                          firstName: widget.firstName,
                                          lastName: widget.lastName,
                                          age: widget.age,
                                          phone: widget.phone,
                                          answers: widget.answers,
                                          imageUrl: imageUrl,
                                          cnnPrediction: cnnPrediction.toString(),
                                          questionnairePrediction: questionnairePrediction.toString(),
                                        );
                                        Navigator.of(context).pushNamed(ResultScreen.routeName).then((value) => setState(() {
                                              showSpinner = false;
                                            }));
                                      } catch (e) {
                                        flutterToast(e.toString());
                                      }
                                    } else {
                                      flutterToast('Please choose an image');
                                    }
                                  }
                                : null,
                            style: checkIsEmpty()
                                ? Theme.of(context).elevatedButtonTheme.style
                                : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                      backgroundColor: MaterialStateProperty.all(kTextColor.withOpacity(0.4)),
                                    ),
                            child: Text(
                              'Proceed',
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
        ),
      ),
    );
  }
}
