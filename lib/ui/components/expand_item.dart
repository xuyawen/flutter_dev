import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget expandItem() {
  return Padding(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 16.w, right: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    "assets/images/qrcode.png",
                  )),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("张潇潇"),
                      Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: Image.asset("assets/images/male-icon.png",
                              width: 12.w, height: 12.h)),
                      Text("35岁"),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Wrap(
                    spacing: 7.w,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 4.w, top: 2.h, right: 4.w, bottom: 2.h),
                        decoration: BoxDecoration(
                            color: Color(0xFF3FD4C8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r))),
                        child: Text("标签名",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12.sp)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("来源：患者报到"), Text("时间：2020/08/12")])
        ],
      ));
}
