import 'package:flutter/material.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'package:flutter_dev/ui/auth/auth.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      allowFontScaling: false,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(56.0)),
            child: SingleChildScrollView(
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
                      style: TextStyle(
                          fontSize: 16.ssp, color: Color(0xFF9B9B9B))),
                  SizedBox(height: 35.0.h),
                  FormInputField(
                      labelText: "请输入账号",
                      suffixIcon: Icon(Icons.cancel,
                          color: Color(0xFFCCCCCC), size: 18.ssp),
                      prefixIcon:
                          Icon(Icons.person_outline, color: Color(0xFFCCCCCC))),
                  FormInputField(
                      labelText: "请输入密码",
                      suffixIcon: Icon(Icons.cancel,
                          color: Color(0xFFCCCCCC), size: 18.ssp),
                      prefixIcon:
                          Icon(Icons.lock_outline, color: Color(0xFFCCCCCC))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              right: ScreenUtil().setHeight(8.0)),
                          child: Icon(Icons.check_circle_rounded,
                              size: 17.0.ssp,
                              color: Color.fromRGBO(83, 216, 209, 1))),
                      Text("我已阅读并同意",
                          style: TextStyle(
                              fontSize: 13.ssp, color: Color(0xFF9B9B9B))),
                      Text("用户注册协议与隐私政策",
                          style: TextStyle(
                              fontSize: 13.ssp, color: Color(0xFF53D8D1))),
                    ],
                  ),
                  SizedBox(height: 20.0.h),
                  LinearGradientButton(
                    text: "登录",
                    onTap: () {
                      print("登录Click");
                    },
                  ),
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
      ),
    );
  }
}
