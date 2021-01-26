import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopExit(
        child: Scaffold(
      body: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                image: AssetImage("assets/images/home-bg.png")),
          ),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.5.h),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("颈椎病临床科研信息采集系统",
                        style:
                            TextStyle(color: Colors.white, fontSize: 16.ssp)),
                    ImageIcon(AssetImage("assets/images/service.png"),
                        size: 24.0.w, color: Colors.white)
                  ],
                ),
              ),
              SizedBox(height: 26.0.h),
              Row(
                children: [
                  SizedBox(width: 11.0.w),
                  SizedBox(
                    width: 69.0.w,
                    height: 69.0.h,
                    child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 255, 255, .2),
                        backgroundImage:
                            AssetImage("assets/images/doctor-default.png")),
                  ),
                  SizedBox(width: 11.0.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("张医生",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.ssp)),
                          Container(
                            margin: EdgeInsets.only(left: 8.0.w),
                            padding: EdgeInsets.only(right: 6.0.w),
                            height: 19.h,
                            width: 69.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/badge.png"),
                              ),
                            ),
                            child: Text(
                              "主任医师",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.ssp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5.h),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Text("上海龙华医院",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  height: 1.h)),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                            child: Text("|",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    height: 1.h)),
                          ),
                          Text(
                            "骨科",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0.sp,
                                height: 1.h),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 7.h),
              Container(
                width: 268.0.w,
                height: 24.0.h,
                margin: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, .12),
                    borderRadius: BorderRadius.all(Radius.circular(3.r))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("当前管理患者",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              height: 1.h)),
                      Text(" 99 ",
                          style: TextStyle(
                              color: Color(0xFFFFEB6A),
                              fontSize: 14.sp,
                              height: 1.h)),
                      Text("人",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              height: 1.h)),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                        child: Text("|",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                height: 1.h)),
                      ),
                      Text("采集量表",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              height: 1.h)),
                      Text(" 189 ",
                          style: TextStyle(
                              color: Color(0xFFFFEB6A),
                              fontSize: 14.sp,
                              height: 1.h)),
                      Text("份",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              height: 1.h)),
                    ]),
              ),
              SizedBox(height: 22.h),
              Container(
                width: 343.w,
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                padding: EdgeInsets.only(
                    top: 14, left: 40.w, right: 40.w, bottom: 14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(198, 219, 214, .34),
                          offset: Offset(0, 1.5),
                          blurRadius: 25.0)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(91, 213, 193, .3),
                              offset: Offset(0, 1.5),
                              blurRadius: 7.0)
                        ]),
                        child: Image.asset("assets/images/qrcode.png",
                            width: 38, height: 38),
                      ),
                      SizedBox(height: 8),
                      Text("二维码名片",
                          style: TextStyle(
                              color: Color(0xFF333333), fontSize: 14.sp))
                    ]),
                    Column(children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(135, 193, 247, .3),
                              offset: Offset(0, 1.5),
                              blurRadius: 7.0)
                        ]),
                        child: Image.asset("assets/images/patient.png",
                            width: 38, height: 38),
                      ),
                      SizedBox(height: 8),
                      Text("患者报到",
                          style: TextStyle(
                              color: Color(0xFF333333), fontSize: 14.sp))
                    ]),
                    Column(children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(91, 213, 193, .3),
                              offset: Offset(0, 0),
                              blurRadius: 7.0)
                        ]),
                        child: Image.asset("assets/images/group-message.png",
                            width: 38, height: 38),
                      ),
                      SizedBox(height: 8),
                      Text("群发消息",
                          style: TextStyle(
                              color: Color(0xFF333333), fontSize: 14.sp))
                    ])
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                  width: 343.w,
                  height: 52.h,
                  padding: EdgeInsets.only(left: 10.w),
                  margin: EdgeInsets.only(left: 16.w, right: 16.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(198, 219, 214, .34),
                            offset: Offset(0, 1.5),
                            blurRadius: 25.0)
                      ]),
                  child: Row(
                    children: [
                      Image.asset("assets/images/todo-img.png",
                          width: 91.5.w, height: 14.h),
                      SizedBox(width: 10.w),
                      Text(" 【患者报到】",
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xFFF9AF01))),
                      SizedBox(width: 6.w),
                      Text("您有新的患者报到！",
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xFF333333)))
                    ],
                  )),
              SizedBox(height: 30.h),
              Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Text("医生工作站",
                      style: TextStyle(
                          color: Color(0xFF333333), fontSize: 18.sp))),
              SizedBox(height: 16.5.h),
              Row(
                children: [
                  SizedBox(width: 21.5.w),
                  Column(children: [
                    shadowIcon(
                        Image.asset("assets/images/my-patient.png",
                            width: 52.21, height: 52.36),
                        "我的患者",
                        Color.fromRGBO(101, 163, 238, 1)),
                    SizedBox(height: 18.h),
                    shadowIcon(
                        Image.asset("assets/images/my-department.png",
                            width: 46.42, height: 47.42),
                        "我的科室",
                        Color.fromRGBO(245, 149, 88, 1))
                  ]),
                  Spacer(),
                  Column(
                    children: [
                      shadowIcon(
                          Image.asset("assets/images/cure-record.png",
                              width: 45, height: 45),
                          "治疗记录",
                          Color.fromRGBO(246, 198, 73, 1)),
                      SizedBox(height: 18.h),
                      shadowIcon(
                          Image.asset("assets/images/questionnaire.png",
                              width: 45, height: 46.84),
                          "问卷量表",
                          Color.fromRGBO(88, 212, 171, 1)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      shadowIcon(
                          Image.asset("assets/images/advisory-message.png",
                              width: 45.97, height: 45.89),
                          "咨询消息",
                          Color.fromRGBO(245, 148, 88, 1)),
                      SizedBox(height: 18.h),
                      shadowIcon(
                          Image.asset("assets/images/follow-template.png",
                              width: 45.84, height: 47.27),
                          "随访模板",
                          Color.fromRGBO(106, 166, 241, 1)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      shadowIcon(
                          Image.asset("assets/images/follow-plan.png",
                              width: 45, height: 46.15),
                          "随访计划",
                          Color.fromRGBO(89, 212, 172, 1)),
                      SizedBox(height: 18.h),
                      shadowIcon(
                          Image.asset("assets/images/me.png",
                              width: 45.03, height: 47.13),
                          "个人中心",
                          Color.fromRGBO(255, 197, 19, 1)),
                    ],
                  ),
                  SizedBox(width: 21.5.w),
                ],
              )
            ],
          ))),
    ));
  }
}

Widget shadowIcon(Image image, String text, Color color) {
  return Column(children: [
    Stack(
      clipBehavior: Clip.none,
      children: [
        image,
        Positioned(
            left: 13,
            bottom: -5,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: color, offset: Offset(0, -7), blurRadius: 9.0),
              ]),
              child: SizedBox(
                height: 5,
                width: 20,
              ),
            ))
      ],
    ),
    SizedBox(
      height: 2,
    ),
    Text(text, style: TextStyle(color: Color(0xFF333333), fontSize: 12.sp))
  ]);
}
