import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 153.5.h),
                  Container(
                    alignment: Alignment.center,
                    width: 84.0.w,
                    height: 84.0.h,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF5AD8B2),
                              Color(0xFF4CD9EE),
                            ])),
                    child: Icon(
                      Icons.polymer,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0.h, bottom: 10.0.h),
                    child: Text(
                      "暂定文案",
                      style: TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0.ssp),
                    ),
                  ),
                  Text(
                    "颈椎病临床研究信息采集系统",
                    style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0.ssp),
                  ),
                  SizedBox(height: 125.h),
                  // AnimatedBuilder(
                  //   builder: (context, widget) => Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/splash-green.png",
                  //         width: 22.0.w,
                  //         height: 24.5.h,
                  //       ),
                  //       Image.asset(
                  //         "assets/images/splash-yellow.png",
                  //         width: 22.0.w,
                  //         height: 24.5.h,
                  //       )
                  //     ],
                  //   ),
                  //   animation: _.animationController,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/splash-green.png",
                        width: 22.0.w,
                        height: 24.5.h,
                      ),
                      Image.asset(
                        "assets/images/splash-yellow.png",
                        width: 22.0.w,
                        height: 24.5.h,
                      )
                    ],
                  ),
                  SizedBox(height: 132.h),
                  Text(
                    "上海龙华医院 & 上海长征医院",
                    style: TextStyle(
                        color: Color(0xFF999999),
                        fontWeight: FontWeight.normal,
                        fontSize: 13.0.ssp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "v1.0.0",
                    style: TextStyle(
                        color: Color(0xFF999999),
                        fontWeight: FontWeight.normal,
                        fontSize: 13.0.ssp),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// CircularProgressIndicator()