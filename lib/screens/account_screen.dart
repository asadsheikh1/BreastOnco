import 'package:breast_onco/constants/repository.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:breast_onco/utils/cache.dart';
import 'package:breast_onco/widgets/profile_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const routeName = '/account';

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
                'User Account',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: kSecondarySwatchColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16.0),
              StreamBuilder(
                stream: Repository.databaseUser.onValue,
                builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
                    final dataListKeys = data.keys.toList();

                    for (int index = 0; index < dataListKeys.length; index++) {
                      if (data[dataListKeys[index]]['email'].toString() == UserCacheData.userEmail || uncachedEmail == data[dataListKeys[index]]['email'].toString()) {
                        return Text(
                          '${data[dataListKeys[index]]['first_name']}${data[dataListKeys[index]]['last_name']}',
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: kSecondarySwatchColor,
                              ),
                        );
                      }
                    }
                  }
                  return const Center(child: CircularProgressIndicator.adaptive());
                },
              ),
              StreamBuilder(
                stream: Repository.databaseUser.onValue,
                builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
                    final dataListKeys = data.keys.toList();

                    for (int index = 0; index < dataListKeys.length; index++) {
                      if (data[dataListKeys[index]]['email'].toString() == UserCacheData.userEmail || uncachedEmail == data[dataListKeys[index]]['email'].toString()) {
                        return Text(
                          '${data[dataListKeys[index]]['email']}',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: kSecondarySwatchColor,
                              ),
                        );
                      }
                    }
                  }
                  return const Center(child: CircularProgressIndicator.adaptive());
                },
              ),
              const SizedBox(height: 16.0),
              ProfileOptions(
                title: 'Logout',
                icon: Icons.logout,
                onTap: () {
                  Repository.logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
