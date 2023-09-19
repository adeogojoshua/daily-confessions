import 'dart:async';

import 'package:daily_confessions/screens/Dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/confessionsLogo.png',
              width: 180,
            ),
          ),
          const Positioned(
              bottom: 0,
              child: Row(
                children: [
                  Icon(
                    IconData(0xe198, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                  ),
                  Text(
                    " IdiaTech. 2023",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
