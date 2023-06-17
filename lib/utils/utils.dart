import 'package:bitcoin/theme/app_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {

  static Future<bool> isConnectedToInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  static void showErrorSnackBar(String? error, {bool instantInit = true}) {
    Get.snackbar("Error", error!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        instantInit: instantInit,
        colorText: whiteColor,
        margin: const EdgeInsets.only(bottom: 200, left: 10, right: 10));
  }

  static void showAlertSnackBar(String error, {bool instantInit = true}) {
    Get.snackbar(
      "Alert", error,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.yellow,
      instantInit: instantInit,
      margin: const EdgeInsets.only(bottom: 200, left: 10, right: 10),
    );
  }

  static void showSuccessSnackBar(String? error) {
    Get.snackbar(
      "Success", error!,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: whiteColor,
      margin: const EdgeInsets.only(bottom: 200, left: 10, right: 10),
    );
  }
}


