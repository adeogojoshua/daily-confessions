import 'package:daily_confessions/controller/controller.dart';
import 'package:daily_confessions/models/con_category.dart';
import 'package:daily_confessions/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoading = true;

  Controller controller = Controller();

  List<ConCategory> categories = [];

  @override
  void initState() {
    super.initState();

    fetchCategories();
  }

  Future fetchCategories() async {
    categories = await controller.fetchCategories();

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
        automaticallyImplyLeading: false,
        title: const Text("Daily Confessions"),
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
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                // physics: ScrollPhysics(),
                physics: const AlwaysScrollableScrollPhysics(),

                // controller: scrollController,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  ConCategory category = categories[index];
                  return CategoryWidget(category: category);
                },
              ),
            ),
    );
  }
}
