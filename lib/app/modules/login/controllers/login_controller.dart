import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController(),
      passwordC = TextEditingController();
  RxBool loading = false.obs;

  login(context) async {
    loading.value = true;

    try {
      AuthController().loginProses(emailC.text, passwordC.text, context);
    } catch (e) {
      log('kesalahan $e');
    }

    loading.value = false;
  }
}
