import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiController extends GetxController {
  Future fetchData({endPoint}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");
    final response = await http.get(
      Uri.parse('https://story-api.dicoding.dev/v1/$endPoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    log("response: ${response.body}");
    log(endPoint);
    return response.body;
  }

  Future postData({endPoint, body}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");
    final response = await http.post(
      Uri.parse('https://story-api.dicoding.dev/v1/$endPoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return json.decode(response.body);
  }
}
