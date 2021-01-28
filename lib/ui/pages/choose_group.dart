import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';

class ChooseGroup extends StatelessWidget {
  const ChooseGroup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF50DEB4), Color(0xFF4CD9ED)],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("选择成员",
            style: TextStyle(
                color: Colors.white,
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
                          vertical: 10.h, horizontal: 16.w),
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
                              borderSide: BorderSide(
                                  color: Color(0xFFE1E1E1), width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFE1E1E1), width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            filled: true,
                            fillColor: Color(0xFFFFFFFF)),
                        maxLines: 1,
                      )),
                  ExpandableNotifier(
                      child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: true,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            iconColor: Color(0xFFCCCCCC),
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                              child: Row(
                                children: [
                                  Text(
                                    "神经根型颈椎病",
                                    style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 16.sp),
                                  ),
                                  Text(
                                    "（31）",
                                    style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14.sp),
                                  )
                                ],
                              )),
                          expanded: GestureDetector(
                            onTap: () => Get.toNamed(Routes.PATIENTDETAIL),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  for (var _ in Iterable.generate(20))
                                    patientItem(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  ExpandableNotifier(
                      child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: true,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            iconColor: Color(0xFFCCCCCC),
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                              child: Row(
                                children: [
                                  Text(
                                    "神经根型颈椎病",
                                    style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 16.sp),
                                  ),
                                  Text(
                                    "（31）",
                                    style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14.sp),
                                  )
                                ],
                              )),
                          expanded: GestureDetector(
                            onTap: () => Get.toNamed(Routes.PATIENTDETAIL),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  for (var _ in Iterable.generate(20))
                                    patientItem(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              width: ScreenUtil().screenWidth,
              height: 62.5.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/selected.png",
                          width: 22.w, height: 22.h),
                      SizedBox(width: 4.w),
                      Text("全选",
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 92.w,
                      height: 42.5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          gradient: const LinearGradient(colors: [
                            Color(0xFF58DCB4),
                            Color(0xFF4CD9EE),
                          ])),
                      child: Text("确认群发",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget patientItem() {
  return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 16.w, right: 12.w),
      color: Color(0xFFF5F8F8),
      child: Row(
        children: [
          Image.asset("assets/images/selected.png", width: 20.w, height: 20.h),
          SizedBox(width: 6.w),
          CircleAvatar(
              backgroundImage: AssetImage(
            "assets/images/patient-remind.png",
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
                  Text("35岁",
                      style:
                          TextStyle(color: Color(0xFF999999), fontSize: 12.sp)),
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
                        borderRadius: BorderRadius.all(Radius.circular(4.r))),
                    child: Text("标签名",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 4.w, top: 2.h, right: 4.w, bottom: 2.h),
                    decoration: BoxDecoration(
                        color: Color(0xFF3FD4C8),
                        borderRadius: BorderRadius.all(Radius.circular(4.r))),
                    child: Text("标签名",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  )
                ],
              )
            ],
          )
        ],
      ));
}
