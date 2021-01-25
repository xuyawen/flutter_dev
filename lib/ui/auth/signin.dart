import 'package:flutter/material.dart';
import 'package:flutter_dev/constants/constants.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'package:flutter_dev/ui/auth/auth.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends GetView<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopExit(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(40.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(81.0)),
                  child: Text("欢迎进入",
                      style: TextStyle(
                          fontSize: 28.ssp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333))),
                ),
                SizedBox(height: 14.0.h),
                Text("颈椎病临床研究信息采集系统",
                    style:
                        TextStyle(fontSize: 16.ssp, color: Color(0xFF9B9B9B))),
                SizedBox(height: 35.0.h),
                FormInputField(
                    labelText: "请输入账号",
                    controller: controller.usernameController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (_) => controller.onUsernameChanged(_),
                    suffixIcon: Obx(() => controller.username.isNotEmpty
                        ? GestureDetector(
                            onTap: () => controller.onUsernameChanged(''),
                            child: Icon(Icons.cancel,
                                color: Color(0xFFCCCCCC), size: 15.ssp),
                          )
                        : SizedBox.shrink()),
                    prefixIcon: Icon(IconData(0xe602, fontFamily: 'iconfont'),
                        size: 20.ssp, color: Color(0xFFACACAC))),
                SizedBox(height: 10.0.h),
                FormInputField(
                    labelText: "请输入密码",
                    obscureText: true,
                    controller: controller.passwordController,
                    onChanged: (_) => controller.onPasswordChanged(_),
                    suffixIcon: Obx(() => controller.password.isNotEmpty
                        ? GestureDetector(
                            onTap: () => controller.onPasswordChanged(''),
                            child: Icon(Icons.cancel,
                                color: Color(0xFFCCCCCC), size: 15.ssp),
                          )
                        : SizedBox.shrink()),
                    prefixIcon: Icon(IconData(0xe60b, fontFamily: 'iconfont'),
                        size: 20.ssp, color: Color(0xFFACACAC))),
                SizedBox(height: 16.0.h),
                GestureDetector(
                  onTap: () => controller.onPrivacyAgreementChanged(
                      !controller.privacyAgreement.value),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              right: ScreenUtil().setHeight(8.0)),
                          child: Obx(() => Icon(
                              controller.privacyAgreement.value
                                  ? Icons.check_circle_rounded
                                  : Icons.brightness_1_outlined,
                              size: 17.0.ssp,
                              color: Color.fromRGBO(83, 216, 209, 1)))),
                      Text("我已阅读并同意",
                          style: TextStyle(
                              fontSize: 13.ssp, color: Color(0xFF9B9B9B))),
                      Text("用户注册协议与隐私政策",
                          style: TextStyle(
                              fontSize: 13.ssp, color: Color(0xFF53D8D1))),
                    ],
                  ),
                ),
                SizedBox(height: 20.0.h),
                Obx(() => LinearGradientButton(
                      linearGradient: controller.username.isNotEmpty &&
                              controller.password.isNotEmpty
                          ? const LinearGradient(colors: [
                              Color(0xFF58DCB4),
                              Color(0xFF4CD9EE),
                            ])
                          : null,
                      text: "登录",
                      onTap: () {
                        if (controller.username.isEmpty ||
                            controller.password.isEmpty)
                          return showSnackbar(
                              "提示", "请输入账号和密码", SnackPosition.TOP);

                        if (!controller.privacyAgreement.value)
                          return showSnackbar(
                              "提示", "请阅读并勾选用户注册协议与隐私政策", SnackPosition.BOTTOM);
                        Get.offAllNamed(Routes.HOME);
                        // Get.toNamed(Routes.HOME);
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelButton(
                      labelText: "注册",
                      onPressed: () => Get.to(SignUp()),
                    ),
                    LabelButton(
                      labelText: "忘记密码",
                      onPressed: () => Get.to(ResetPassword()),
                    ),
                  ],
                ),
                SizedBox(height: 196.5.h),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      "遇到问题？",
                      style: TextStyle(color: Color(0xFF999999)),
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

void showSnackbar(String title, String content, SnackPosition snackPosition) {
  Get.snackbar(
    title, // title
    content, // message
    snackPosition: snackPosition,
    icon: Icon(Icons.info),
    shouldIconPulse: true,
    margin: EdgeInsets.only(
        top: ScreenUtil()
            .setHeight(snackPosition == SnackPosition.TOP ? 30.0 : 0.0),
        left: ScreenUtil().setHeight(20.0),
        right: ScreenUtil().setHeight(20.0),
        bottom: ScreenUtil()
            .setHeight(snackPosition == SnackPosition.BOTTOM ? 30.0 : 0.0)),
    barBlur: 20,
    isDismissible: true,
    duration: Duration(seconds: 3),
  );
}
