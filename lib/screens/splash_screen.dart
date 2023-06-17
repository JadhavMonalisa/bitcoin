import 'dart:async';
import 'package:bitcoin/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/assets.dart';
import '../../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  String userId="";
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    return Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.bitcoinScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height/2.5,width: MediaQuery.of(context).size.width,
            child: Image.asset(Assets.splashLogo,fit: BoxFit.fill),
          )
      ),
    );
  }
}
