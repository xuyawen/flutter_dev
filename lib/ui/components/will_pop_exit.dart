import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WillPopExit extends StatelessWidget {
  const WillPopExit({Key key, this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    DateTime lastPopTime;
    return WillPopScope(
        child: child,
        onWillPop: () async {
          // 点击返回键的操作
          if (lastPopTime == null ||
              DateTime.now().difference(lastPopTime).inSeconds > 1.5) {
            lastPopTime = DateTime.now();
            Get.snackbar(
              "提示", // title
              "再按一次退出", // message
              snackPosition: SnackPosition.BOTTOM,
              icon: Icon(Icons.info),
              shouldIconPulse: true,
              margin: EdgeInsets.only(
                  left: ScreenUtil().setHeight(20.0),
                  right: ScreenUtil().setHeight(20.0),
                  bottom: ScreenUtil().setHeight(30.0)),
              barBlur: 20,
              isDismissible: true,
              duration: Duration(seconds: 3),
            );
            return false;
          } else {
            lastPopTime = DateTime.now();
            // 退出app
            exit(0);
          }
        });
  }
}
