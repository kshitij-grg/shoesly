import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app/constants/app_colors.dart';

errorToast({required String message}) {
  CustomToasts.showToast(message: message, color: AppColors.kERROR);
}

infoToast({required String? message}) {
  CustomToasts.showToast(message: message ?? "", color: AppColors.kINFORMATION);
}

successToast({required String? message}) {
  CustomToasts.showToast(message: message ?? "", color: AppColors.kSUCCESS);
}

class CustomToasts {
  static void showToast({
    required String message,
    Color? color = AppColors.kSUCCESS,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
