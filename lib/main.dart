import 'package:breast_onco/firebase_options.dart';
import 'package:breast_onco/screens/splash_screen.dart';
import 'package:breast_onco/themes/cubit/theme_cubit.dart';
import 'package:breast_onco/themes/theme_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:breast_onco/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Breast Onco',
        theme: ThemeStyle.lightTheme,
        initialRoute: SplashScreen.routeName,
        routes: PageRoutes().routes(),
      ),
    );
  }
}
