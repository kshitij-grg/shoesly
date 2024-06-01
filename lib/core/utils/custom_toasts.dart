import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../app/constants/app_colors.dart';

errorToast({required String msg, required BuildContext context}) {
  CustomToasts.showToast(msg: msg, color: context.colors.error);
}

successToast({required String? msg, required BuildContext context}) {
  CustomToasts.showToast(msg: msg ?? "", color: context.colors.sucess);
}

class CustomToasts {
  static void showToast({
    required String msg,
    Color? color = AppColors.kSUCCESS,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
