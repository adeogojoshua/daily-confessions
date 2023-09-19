import 'package:daily_confessions/constants/app_constants.dart';

class AppUrls {
  static String baseUrl = AppConstants.env == "DEV"
      ? "http://10.0.2.2:8000"
      : "https://dailyconfessions.idiatech.com";
  static String rootUrl = "$baseUrl/api/v1";

  static String categoriesUrl = "$rootUrl/category";
}
