import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class FollowDetail extends StatelessWidget {
  const FollowDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF666666)),
          title: Text("随访详情",
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .03),
                        offset: Offset(0, 1.5),
                        blurRadius: 23.0)
                  ]),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 27.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 39,
                            height: 39,
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage(Utils.assetsPath("qrcode"))),
                          ),
                          SizedBox(width: 8.w),
                          Utils.text("韩梅梅", Color(0xFF333333),
                              size: 14.sp, weight: FontWeight.bold),
                          SizedBox(width: 8.w),
                          Image.asset(Utils.assetsPath("female-icon"),
                              width: 12, height: 12),
                          SizedBox(width: 6.w),
                          Utils.text("35岁", Color(0xFF999999), size: 12.sp),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 34.h, horizontal: 16.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F8F8),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .12),
                                  offset: Offset(0, 3),
                                  blurRadius: 20.0)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r))),
                        width: ScreenUtil().screenWidth,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 13.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.r),
                                      topRight: Radius.circular(8.r)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF4DD5AC),
                                      Color(0xFF30D4EC)
                                    ],
                                  )),
                              alignment: Alignment.center,
                              child: Utils.text("颈椎病通用随访模板", Colors.white,
                                  size: 20.sp, weight: FontWeight.bold),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r))),
                              padding: EdgeInsets.only(
                                  top: 20.h,
                                  left: 16.w,
                                  right: 25.w,
                                  bottom: 56.h),
                              child: Column(
                                children: [
                                  Image.asset(Utils.assetsPath("title-img_02"),
                                      width: 155.5.w, height: 22.75.h),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Utils.text("随访开始日期:2021-01-19",
                                          Color(0xFF333333),
                                          size: 14.sp, weight: FontWeight.bold),
                                      Row(
                                        children: [
                                          Container(
                                              width: 3,
                                              height: 3,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBCA0A),
                                                shape: BoxShape.circle,
                                              )),
                                          SizedBox(width: 5.w),
                                          Container(
                                              width: 4,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBCA0A),
                                                shape: BoxShape.circle,
                                              )),
                                          SizedBox(width: 5.w),
                                          Utils.text("随访中", Color(0xFFFBCA0A),
                                              size: 14.sp,
                                              weight: FontWeight.bold),
                                          SizedBox(width: 5.w),
                                          Container(
                                              width: 4,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBCA0A),
                                                shape: BoxShape.circle,
                                              )),
                                          SizedBox(width: 5.w),
                                          Container(
                                              width: 3,
                                              height: 3,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBCA0A),
                                                shape: BoxShape.circle,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Column(
                                    children: [
                                      for (var _ in Iterable.generate(20))
                                        _followTimeline(),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: 81.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .05),
                        offset: Offset(0, -7.5),
                        blurRadius: 15.0)
                  ]),
                  child: Utils.text("取消随访", Color(0xFFFF5C3A),
                      size: 17.sp, weight: FontWeight.bold),
                )
              ],
            )));
  }

  Widget _followTimeline() {
    return Timeline(
        style: TimelineStyle(
            pointType: TimelinePointType.Circle,
            pointColor: Color(0xFF66E1D7),
            lineType: TimelineLineType.Full,
            lineColor: Color(0xFF66E1D7)),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: 0,
                  left: -33,
                  child: Image.asset(Utils.assetsPath("clock-icon"),
                      width: 20.5.w, height: 20.5.h)),
              Positioned(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Utils.text("就诊后第2天", Color(0xFF333333),
                          size: 14.sp, weight: FontWeight.bold),
                      Utils.text("（2021-01-20 12:00)", Color(0xFF999999),
                          size: 14.sp),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Utils.text("量表问卷：", Color(0xFF666666), size: 14.sp),
                      Container(
                        padding: EdgeInsets.only(bottom: 1.h),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFF00BFAF)))),
                        child: Text("《颈椎病问卷量表1》",
                            style: TextStyle(
                              color: Color(0xFF00BFAF),
                              fontSize: 14.sp,
                            )),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
