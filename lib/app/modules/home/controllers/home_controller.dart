import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_dicoding/app/data/stories_model.dart';

class HomeController extends GetxController {
  Future getStories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http
        .get(Uri.parse('https://story-api.dicoding.dev/v1/stories'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return Stories.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal mengambil stories');
    }
  }
}
