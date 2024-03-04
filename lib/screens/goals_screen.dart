import 'package:breast_onco/constants/repository.dart';
import 'package:breast_onco/screens/patient_details.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/utils/cache.dart';
import 'package:breast_onco/widgets/goal_list_tile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);
  static const routeName = '/goals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              StreamBuilder(
                stream: Repository.databaseUser.onValue,
                builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
                    final filteredUsers = data.values.where((user) {
                      final email = user['email'].toString();
                      return email == UserCacheData.userEmail || uncachedEmail == email;
                    }).toList();

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: filteredUsers.map((user) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20.0),
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
                                    sStream = map.values.where((item) => item['email'] == user['email']).toList();

                                    return Column(
                                      children: [
                                        ...sStream.map((patient) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) => PatientDetails(
                                                    id: patient['id'],
                                                    firstName: patient['firstName'],
                                                    lastName: patient['last_name'],
                                                    email: patient['email'],
                                                    age: patient['age'],
                                                    phone: patient['phone'],
                                                    imageUrl: patient['imageUrl'],
                                                    answers: patient['answers'],
                                                    cnnPrediction: patient['cnnPrediction'],
                                                    questionnairePrediction: patient['questionnairePrediction'],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: GoalListTile(icon: Icons.person, title: "${patient['firstName']} ${patient['last_name']}", subtitle: "Age: ${patient['age']}", id: patient['id']),
                                          );
                                        })
                                      ],
                                    );
                                  }
                                  return Container();
                                }
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
