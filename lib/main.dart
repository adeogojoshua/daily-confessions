import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;

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
      home: const MyHomePage(title: 'Daily Confessions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List confessions = [];

  @override
  void initState() {
    super.initState();
    readJsonData(path: "assets/confessions.json");
  }

  void readJsonData({required String path}) async {
    // read json file
    final jsondata = await root_bundle.rootBundle.loadString(path);

    // decode json data as list
    final list = json.decode(jsondata) as Map;

    // map json and initialize
    // using DataModel
    setState(() {
      confessions = list['confessions'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 25, 44, 59),
      ),
      backgroundColor: const Color(0xff324a5e),
      body: Center(
        child: ListView.builder(
          itemCount: confessions.length,
          itemBuilder: (context, index) {
            String confession = confessions[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    confession,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 18, height: 2),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
              ],
            );
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
