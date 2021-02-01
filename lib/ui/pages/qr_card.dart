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
        shadowColor: Color(0xFF58DCB4),
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
                  padding: EdgeInsets.only(left: 37.w),
                  margin: EdgeInsets.fromLTRB(40.w, 66.h, 40.w, 55.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                          image: AssetImage("assets/images/qrcode-bg.png"))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.0.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 56.0.w,
                            height: 56.0.h,
                            child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, .2),
                                backgroundImage: AssetImage(
                                    "assets/images/doctor-default.png")),
                          ),
                          SizedBox(width: 4.0.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("张医生",
                                      style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 16.ssp)),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0.w),
                                    padding: EdgeInsets.only(left: 13.0.w),
                                    height: 19.h,
                                    width: 69.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.r)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/badge.png"),
                                      ),
                                    ),
                                    child: Text("主任医师",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.ssp,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Text("上海龙华医院",
                                      style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 14.sp,
                                          height: 1.h)),
                                  SizedBox(width: 20.w),
                                  Text(
                                    "骨科",
                                    style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14.0.sp,
                                        height: 1.h),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Image.asset("assets/images/qrcode-img.png",
                              width: 211.w, height: 211.h)),
                      SizedBox(height: 20.h),
                      Padding(
                          padding: EdgeInsets.only(left: 8.5.w),
                          child: Text("患者扫一扫上面的二维码，加入工作站",
                              style: TextStyle(
                                  color: Color(0xFF999999), fontSize: 12.sp)))
                    ],
                  )),
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
