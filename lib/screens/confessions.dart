import 'package:daily_confessions/controller/controller.dart';
import 'package:daily_confessions/models/con_category.dart';
import 'package:daily_confessions/models/confession.dart';
import 'package:flutter/material.dart';

class Confessions extends StatefulWidget {
  const Confessions({super.key, required this.category});

  final ConCategory category;

  @override
  State<Confessions> createState() => _ConfessionsState();
}

class _ConfessionsState extends State<Confessions> {
  bool isLoading = true;

  Controller controller = Controller();

  List<Confession> confessions = [];

  @override
  void initState() {
    super.initState();

    fetchConfessions();
  }

  Future fetchConfessions() async {
    confessions =
        await controller.fetchConfessions(categoryID: widget.category.id);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
        backgroundColor: const Color.fromARGB(255, 25, 44, 59),
      ),
      backgroundColor: const Color(0xff324a5e),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 25, 44, 59),
                color: Colors.white,
              ),
            )
          : Center(
              child: ListView.builder(
                itemCount: confessions.length,
                itemBuilder: (context, index) {
                  Confession confession = confessions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          confession.body,
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
    );
  }
}
