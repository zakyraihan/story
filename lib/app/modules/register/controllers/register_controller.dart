import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app_dicoding/app/controllers/auth_controller.dart';

class RegisterController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController namaC = TextEditingController(),
      emailC = TextEditingController(),
      passwordC = TextEditingController();

  @override
  void onClose() {
    namaC.dispose();
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  register(context) async {
    loading.value = true;

    try {
      AuthController()
          .register(namaC.text, emailC.text, passwordC.text, context);
    } catch (e) {
      log('kesalahan $e');
    }

    loading.value = false;
  }
}
