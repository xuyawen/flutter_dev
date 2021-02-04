import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class FollowTemplate extends StatelessWidget {
  const FollowTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        title: Text("随访计划模板库",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
        actions: [
          SizedBox(
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    overlayColor: MaterialStateProperty.all(Color(0xFF999999)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Color(0xFFFFFFFF))),
                onPressed: () async {},
                child: Text("筛选",
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Color(0xFFF5F8F8),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 12.h,
                      children: [
                        for (var _ in Iterable.generate(7)) templateItem(),
                      ],
                    ),
                    Container(
                      width: 343.w,
                      height: 62.h,
                      alignment: Alignment.center,
                      child: Text("— 没有更多内容啦 —",
                          style: TextStyle(
                              color: Color(0xFFC7C7C7), fontSize: 13.sp)),
                    )
                  ],
                ),
              ),
            ),
            _dropDown(),
          ],
        ),
      ),
    );
  }

  Widget _dropDown() {
    return Positioned(
        top: 0,
        child: Container(
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.text("全部", Color(0xFF666666),
                          size: 16.sp, weight: FontWeight.bold),
                      Image.asset(Utils.assetsPath("right-icon"),
                          width: 22.w, height: 22.h)
                    ],
                  )),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.text("科室共享模版库", Color(0xFF666666),
                          size: 16.sp, weight: FontWeight.bold),
                      // Image.asset(Utils.assetsPath("right-icon"), width: 22.w, height: 22.h)
                    ],
                  )),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.text("我的创建模板", Color(0xFF666666),
                          size: 16.sp, weight: FontWeight.bold),
                      // Image.asset(Utils.assetsPath("right-icon"), width: 22.w, height: 22.h)
                    ],
                  ))
            ],
          ),
        ));
  }

  Widget templateItem() {
    return Container(
      width: 343.w,
      height: 87.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(Utils.assetsPath("decorate-01"),
                  width: 9.w, height: 28.h),
              SizedBox(width: 13.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("颈椎病通用随访模板1",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text("创建者:",
                          style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 10.w),
                      Text("张医生-龙华医院骨科",
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
