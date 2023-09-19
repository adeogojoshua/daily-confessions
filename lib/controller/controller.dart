import 'dart:convert';
import 'package:daily_confessions/models/confession.dart';
import 'package:http/http.dart' as http;
import 'package:daily_confessions/models/con_category.dart';
import 'package:daily_confessions/constants/app_urls.dart';

class Controller {
  Future<List<ConCategory>> fetchCategories() async {
    String url = AppUrls.categoriesUrl;

    List<ConCategory> categories = [];

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token"
    });

    if (response.statusCode != 200) return categories;

    var data = jsonDecode(response.body);
    var operatorData = data['data'];

    for (var item in operatorData) {
      ConCategory category = ConCategory(
        id: item['id'],
        title: item['title'],
      );

      categories.add(category);
    }

    return categories;
  }

  Future<List<Confession>> fetchConfessions({required int categoryID}) async {
    String url = '${AppUrls.categoriesUrl}/$categoryID';

    List<Confession> confessions = [];

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token"
    });

    if (response.statusCode != 200) return confessions;

    var data = jsonDecode(response.body);
    var operatorData = data['data'];

    var confessionsData = operatorData['confessions'];

    for (var item in confessionsData) {
      Confession confession = Confession(
        id: item['id'],
        body: item['body'],
      );

      confessions.add(confession);
    }

    return confessions;
  }
}
