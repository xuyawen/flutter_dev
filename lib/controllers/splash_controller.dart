import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'auth_controller.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    // animationController = AnimationController(
    //     duration: const Duration(milliseconds: 2000),
    //     vsync: this
    // );
    await Future.delayed(Duration(seconds: 3));
    AuthController authController = Get.find<AuthController>();
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
    super.onClose();
  }
}
