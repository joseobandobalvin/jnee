import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jnee/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // alignment: Alignment.center,

          // child: const RiveAnimation.asset(
          //   "assets/images/material-loader.riv",
          // ),
          ),
    );
  }
}
