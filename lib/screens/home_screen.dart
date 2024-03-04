import 'package:breast_onco/constants/repository.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/utils/cache.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    tileColor: kTextColor.withOpacity(0.1),
                    title: StreamBuilder(
                      stream: Repository.databaseUser.onValue,
                      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
                          final dataListKeys = data.keys.toList();

                          for (int index = 0; index < dataListKeys.length; index++) {
                            if (data[dataListKeys[index]]['email'].toString() == UserCacheData.userEmail || uncachedEmail == data[dataListKeys[index]]['email'].toString()) {
                              return Text('Hey, ${data[dataListKeys[index]]['first_name']}! 😃👋', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold));
                            }
                          }
                        }
                        return const Center(child: CircularProgressIndicator.adaptive());
                      },
                    ),
                    subtitle: Text(
                      'Welcome to your dashboard',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kTextColor,
                          ),
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.5,
                    enlargeCenterPage: true,
                  ),
                  items: imgList.map((e) => Image.asset(e)).toList(),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    tileColor: kTextColor.withOpacity(0.1),
                    title: Text(
                      'What is Breast Cancer?',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Breast cancer starts in the breast tissue when mutated cells grow out of control, eventually creating a mass, or tumor.\nCells in our bodies have a normal cell cycle: They grow and divide, making copies of themselves as needed to replace old or abnormal cells.',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kTextColor,
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
