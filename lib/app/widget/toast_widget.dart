import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

void showToast(String title, String desc, AnimationType animationType, context,
    bool ifError) {
  if (!ifError) {
    CherryToast.success(
      title: Text(title),
      description: Text(desc),
      animationType: animationType,
      animationDuration: const Duration(milliseconds: 500),
      autoDismiss: true,
    ).show(context);
  } else {
    CherryToast.error(
      title: Text(title),
      description: Text(desc),
      animationType: animationType,
      animationDuration: const Duration(milliseconds: 500),
      autoDismiss: true,
    ).show(context);
  }
}
