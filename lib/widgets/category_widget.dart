import 'package:daily_confessions/models/con_category.dart';
import 'package:daily_confessions/screens/confessions.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final ConCategory category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Confessions(category: category),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 25, 44, 59),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              // offset: Offset(4, 1),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // FaIcon(
            //   FontAwesomeIcons.bus,
            //   color: AppConfig.secondaryColor,
            //   size: 35,
            // ),
            Text(
              category.title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
