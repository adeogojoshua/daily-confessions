import 'package:daily_confessions/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Confessions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: const Color.fromARGB(255, 25, 44, 59),
        backgroundColor: const Color(0xff324a5e),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xff324a5e),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
