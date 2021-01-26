import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRcard extends StatelessWidget {
  const QRcard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF58DCB4),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text(
          "二维码名片",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF58DCB4),
              Color(0xFF4CD9EE),
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 295.w,
                  height: 370.h,
                  margin: EdgeInsets.fromLTRB(40.w, 66.h, 40.w, 55.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Text("张医生")),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 263.w,
                  height: 50.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(48, 204, 212, 1),
                            offset: Offset(0, 1.5),
                            blurRadius: 18.0)
                      ],
                      gradient: const LinearGradient(colors: [
                        Color(0xFF67EEC4),
                        Color(0xFF69E7F9),
                      ])),
                  child: Text("发送名片到微信",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
