import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class FollowPlan extends StatelessWidget {
  const FollowPlan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        title: Text("随访计划",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
        actions: [
          SizedBox(
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    overlayColor: MaterialStateProperty.all(Color(0xFFE8E8E8)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Color(0xFFFFFFFF))),
                onPressed: () => Get.toNamed(Routes.MODIFYFOLLOW),
                child: Text("新建随访计划",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                        suffixIcon: Icon(
                            IconData(0xe600, fontFamily: 'iconfont'),
                            size: 12.ssp,
                            color: Color(0xFFACACAC)),
                        prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                        hintText: "输入患者相关信息搜索",
                        hintStyle: TextStyle(
                            fontSize: 13.sp, color: Color(0xFF999999)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFE1E1E1), width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFE1E1E1), width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        filled: true,
                        fillColor: Color(0xFFFFFFFF)),
                    maxLines: 1,
                  )),
              Divider(height: 1, color: Color(0xFFD9D9D9)),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
                  child: Row(
                    children: [
                      Container(
                        width: 84.w,
                        height: 48.5.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("全部",
                                style: TextStyle(
                                    color: Color(0xFF00BFAF),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 3.h),
                            Image.asset(Utils.assetsPath("decorate-02"),
                                width: 20.62, height: 8.31)
                          ],
                        ),
                      ),
                      Container(
                        width: 84.w,
                        height: 48.5.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("随访中",
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Container(
                        width: 84.w,
                        height: 48.5.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("已取消",
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Container(
                        width: 84.w,
                        height: 48.5.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("已结束",
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 10.h),
              Wrap(
                direction: Axis.vertical,
                spacing: 10.5.h,
                children: [
                  for (var _ in Iterable.generate(7))
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.FOLLOWDETAIL),
                      child: followItem(),
                    ),
                ],
              ),
              Container(
                width: 343.w,
                height: 62.h,
                alignment: Alignment.center,
                child: Text("— 没有更多内容啦 —",
                    style:
                        TextStyle(color: Color(0xFFC7C7C7), fontSize: 13.sp)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget followItem() {
    return Container(
      width: 343.w,
      height: 165.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(width: 0.5, color: Color(0xFF00BFAF)),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(2, 212, 194, 0.04),
                Color.fromRGBO(2, 212, 194, 0),
                Color.fromRGBO(2, 212, 194, 0),
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  Text("韩梅梅",
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xFF333333))),
                  SizedBox(width: 6.w),
                  Image.asset(Utils.assetsPath("female-icon"),
                      width: 12.w, height: 12.h),
                  SizedBox(width: 6.w),
                  Text("35岁",
                      style:
                          TextStyle(fontSize: 12.sp, color: Color(0xFF999999)))
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                        color: Color(0xFF02D4C2), shape: BoxShape.circle),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        color: Color(0xFF02D4C2), shape: BoxShape.circle),
                  ),
                  SizedBox(width: 4.w),
                  Text("随访中",
                      style: TextStyle(
                          color: Color(0xFF02D4C2),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 4.w),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        color: Color(0xFF02D4C2), shape: BoxShape.circle),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                        color: Color(0xFF02D4C2), shape: BoxShape.circle),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10.h),
          Divider(height: 1, color: Color(0xFFE5E5E5)),
          SizedBox(height: 10.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("随访计划：",
                      style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                  Text("《颈椎病通用随访模板》",
                      style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("创建医生：",
                      style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                  Text("吴医生",
                      style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("创建时间：",
                      style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                  Text("2020-12-30 17:54",
                      style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
