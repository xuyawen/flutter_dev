import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'auth_controller.dart';

class SplashController extends GetxController {
  AnimationController animationController;

  @override
  void onReady() async {
    // animationController = AnimationController(
    //     duration: const Duration(milliseconds: 2000),
    //     vsync: this
    // );
    AuthController authController = Get.find<AuthController>();
    await Future.delayed(Duration(seconds: 3));
    // 如果未登录就登录
    // 如果已登录就去task页面
    if (authController.isLogin) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.SIGNIN);
    }
    super.onReady();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }
}
