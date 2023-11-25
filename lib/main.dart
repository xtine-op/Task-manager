import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  //open a box

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:
          // Lottie.asset('assets/splash.json'),
          Column(
        children: [
          Image.asset('assets/todoapplogo.png'),
          Text(
            'Task Manager',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade50),
          )
        ],
      ),
      backgroundColor: Colors.orange.shade500,
      nextScreen: const HomePage(),
      splashIconSize: 400,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
