import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';

class PatientDetail extends StatelessWidget {
  const PatientDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Color(0xFFF3F9F8),
        child: Column(children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16.w, top: 10.h, bottom: 20.h),
                  color: Color(0xFFFFFFFF),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 66.w,
                        height: 66.h,
                        child: CircleAvatar(
                            backgroundImage: AssetImage(
                          "assets/images/patient-remind.png",
                        )),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("张潇潇"),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 6.w, right: 6.w),
                                  child: Image.asset(
                                      "assets/images/male-icon.png",
                                      width: 12.w,
                                      height: 12.h)),
                              Text("35岁"),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Text("上海市 徐汇区",
                                  style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12.sp))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 16.w, right: 26.w, bottom: 11.h),
                  color: Color(0xFFFFFFFF),
                  child: Column(
                    children: [
                      Divider(height: 1.h, color: Color(0xFFECECEC)),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("患者绑定",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                          Row(children: [
                            Text("患者未绑定",
                                style: TextStyle(
                                    color: Color(0xFF999999), fontSize: 14.sp)),
                            SizedBox(width: 6.w),
                            Icon(Icons.qr_code,
                                size: 16, color: Color(0xFF999999)),
                            SizedBox(width: 10.w),
                            Icon(Icons.keyboard_arrow_right,
                                size: 24, color: Color(0xFF999999))
                          ])
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 26.w, bottom: 14.h, top: 11.h),
                  color: Color(0xFFFFFFFF),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("标签",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                          Icon(Icons.keyboard_arrow_right,
                              size: 24, color: Color(0xFF999999))
                        ],
                      ),
                      SizedBox(height: 11.5.h),
                      Wrap(
                        spacing: 6.w,
                        runSpacing: 6.h,
                        children: [
                          for (var _ in Iterable.generate(20))
                            Container(
                              padding: EdgeInsets.only(
                                  left: 4.w, top: 2.h, right: 4.w, bottom: 2.h),
                              decoration: BoxDecoration(
                                  color: Color(0xFF3FD4C8),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.r))),
                              child: Text("标签名$_",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp)),
                            )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  constraints: BoxConstraints(minHeight: 139.h),
                  padding: EdgeInsets.only(
                      left: 16.w, right: 26.w, bottom: 14.h, top: 11.h),
                  color: Color(0xFFFFFFFF),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("治疗记录",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                          Icon(Icons.keyboard_arrow_right,
                              size: 24, color: Color(0xFF999999))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.MASSMESSAGE),
            child: Container(
              width: ScreenUtil().screenWidth,
              height: 64.h,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message_sharp, color: Colors.white),
                  SizedBox(width: 10.w),
                  Text("发消息",
                      style: TextStyle(color: Colors.white, fontSize: 17.sp))
                ],
              ),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                Color(0xFF58DCB4),
                Color(0xFF4CD9EE),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}
