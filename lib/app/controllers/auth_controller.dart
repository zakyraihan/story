import 'dart:convert';
import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_dicoding/app/controllers/api_controller.dart';
import 'package:story_app_dicoding/app/data/login_model.dart';
import 'package:story_app_dicoding/app/routes/app_pages.dart';
import 'package:story_app_dicoding/app/widget/toast_widget.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  final ApiController apiController = Get.put(ApiController());

  register(String nama, String email, String password, context) async {
    try {
      final response = await apiController.postData(
        endPoint: 'register',
        body: {
          "name": nama,
          "email": email,
          "password": password,
        },
      );

      CherryToast.success(
        title: const Text('Sukses'),
        description: const Text('Register Telah Berhasil!'),
        animationType: AnimationType.fromRight,
        animationDuration: const Duration(milliseconds: 500),
        autoDismiss: true,
      ).show(context);

      Get.offAllNamed(Routes.LOGIN);

      log('res -> $response');
    } catch (e) {
      log('$e');
    }
  }

  Future loginProses(String email, String password, context) async {
    try {
      Uri dataUrl = Uri.parse('https://story-api.dicoding.dev/v1/login');

      Map data = {
        'email': email,
        "password": password,
      };

      var body = json.encode(data);

      final response = await http.post(dataUrl,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
        log(response.body);
        Login loginProses = loginFromJson(response.body.toString());

        showToast('Sukses', 'Login berhasil', AnimationType.fromRight, context,
            false);

        Get.toNamed(Routes.HOME);

        String token = loginProses.loginResult.token;
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('token', token);
        preferences.setString('name', loginProses.loginResult.name);

        return token;
      } else {
        showToast('Gagal', 'Login tidak berhasil', AnimationType.fromRight,
            context, true);
      }
    } catch (e) {
      log('Error -> $e');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }
}
