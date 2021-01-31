import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class ModifyFollow extends StatelessWidget {
  const ModifyFollow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        title: Text("新建随访",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Utils.text("随访计划名称", Color(0xFF333333),
                                size: 16.sp, weight: FontWeight.bold),
                            SizedBox(height: 10.h),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                                  prefixStyle:
                                      TextStyle(color: Color(0xFFD1D1D1)),
                                  hintText: "输入随访计划名称（最多20字）",
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF999999)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFDCDCDC), width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFDCDCDC), width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF)),
                              maxLines: 1,
                            ),
                            SizedBox(height: 16.h),
                            Utils.text("随访开始日期", Color(0xFF333333),
                                size: 16.sp, weight: FontWeight.bold),
                            SizedBox(height: 10.h),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                                  suffixIcon: Icon(Icons.arrow_drop_down,
                                      size: 35.sp, color: Color(0xFFACACAC)),
                                  prefixStyle:
                                      TextStyle(color: Color(0xFFD2D2D2)),
                                  hintText: "请选择随访开始时间",
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF999999)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFDCDCDC), width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFDCDCDC), width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF)),
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(height: 10.h),
                    Divider(height: 1, color: Color(0xFFDBDBDB)),
                    SizedBox(height: 20.h),
                    // VerticalDivider(color: Color(0xFFE9EBEB)),
                    TimelineTile(
                      alignment: TimelineAlign.start,
                      isFirst: true,
                      hasIndicator: true,
                      afterLineStyle: const LineStyle(
                        color: Colors.deepOrange,
                        thickness: 6,
                      ),
                      endChild: Container(
                        constraints: const BoxConstraints(
                          minHeight: 120,
                        ),
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .05),
                      offset: Offset(0, -7.5),
                      blurRadius: 15.0)
                ],
              ),
              child: Column(
                children: [
                  Text("（发放后随访计划将保存为随访模板）",
                      style:
                          TextStyle(color: Color(0xFF999999), fontSize: 14.sp)),
                  SizedBox(height: 8.h),
                  Container(
                    width: ScreenUtil().screenWidth,
                    height: 64.h,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Utils.assetsPath("give-icon"),
                            width: 16.w, height: 16.h),
                        SizedBox(width: 10.w),
                        Text("去发放",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF58DCB4),
                          Color(0xFF4CD9EE),
                        ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
