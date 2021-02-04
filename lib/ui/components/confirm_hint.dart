import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget confirmHint({String title, String content, String cancel, Text ok}) {
  return Center(
    child: Container(
      clipBehavior: Clip.antiAlias,
      width: 283.w,
      height: 163.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 10.h),
              child: Text(title,
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(content,
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 14.sp),
                      textAlign: TextAlign.left))),
          Container(
            height: 47.h,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      alignment: Alignment.center,
                      color: Color(0xFFF4F8F8),
                      child: Text(cancel,
                          style: TextStyle(
                              color: Color(0xFF999999), fontSize: 14.sp),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
                VerticalDivider(color: Color(0xFFE9EBEB)),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      alignment: Alignment.center,
                      color: Color(0xFFF4F8F8),
                      child: ok,
                    ),
                  ),
                ),
              ],
            ),
            color: Color(0xFFF4F8F8),
          )
        ],
      ),
    ),
  );
}
