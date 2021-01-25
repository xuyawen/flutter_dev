import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_dev/ui/auth/auth.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:flutter_dev/ui/components/components.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString username = ''.obs;
  RxString password = ''.obs;
  RxBool privacyAgreement = false.obs;

  bool get isLogin => false;

  void onPrivacyAgreementChanged(bool value) {
    privacyAgreement.value = value;
  }

  void onUsernameChanged(String value) {
    username.value = value.trim();
    if (value == '') usernameController.clear();
  }

  void onPasswordChanged(String value) {
    password.value = value.trim();
    if (value == '') passwordController.clear();
  }

  void devMock() {
    onPrivacyAgreementChanged(true);
    onUsernameChanged('test');
    onPasswordChanged('123123');
    usernameController.text = 'test';
    passwordController.text = '123123';
  }

  @override
  void onReady() async {
    print("12313++++======++++++21323");
    devMock();
    // handleAuthChanged(true);
    super.onReady();
  }

  @override
  void onClose() {
    usernameController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

  handleAuthChanged(isNotLogin) async {
    if (isNotLogin) {
      Get.offAll(SignIn());
    } else {
      Get.offAll(Home());
    }
  }

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {} catch (error) {
      hideLoadingIndicator();
    }
  }

  // Sign out
  Future<void> signOut() async {}
}
