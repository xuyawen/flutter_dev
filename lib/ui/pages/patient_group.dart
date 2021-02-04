import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';

class PatientGroup extends StatelessWidget {
  const PatientGroup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF52DACC),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          shadowColor: Color(0xFF58DCB4),
          elevation: 0,
          title: Text(
            "我的患者",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF2F8F8),
          ),
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                    image: AssetImage("assets/images/patient-group_bg.png")),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Center(
                      child: Container(
                    padding:
                        EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
                    decoration: BoxDecoration(
                        color: Color(0xFFFEFEF4),
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    width: 343.w,
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                child: Image.asset(
                                    "assets/images/patient-remind.png",
                                    width: 24.w,
                                    height: 24.w)),
                            Positioned(
                                top: -7,
                                right: -7,
                                child: Container(
                                  width: 13,
                                  height: 13,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF6F39),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.r))),
                                  child: Text("3",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold)),
                                ))
                          ],
                        ),
                        SizedBox(width: 12.w),
                        Text("患者消息",
                            style: TextStyle(
                                color: Color(0xFFCE8900), fontSize: 14.sp)),
                        SizedBox(width: 105.5.w),
                        Text("4 ",
                            style: TextStyle(
                                color: Color(0xFFCE8900),
                                fontSize: 14.sp,
                                height: 1.5)),
                        Text("条待处理",
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 14.sp)),
                        SizedBox(width: 6.w),
                        Image.asset("assets/images/patient-to.png",
                            width: 17.w, height: 17.w),
                      ],
                    ),
                  )),
                  SizedBox(height: 16.h),
                  Center(
                      child: Container(
                    width: 343.w,
                    padding: EdgeInsets.fromLTRB(22.5.w, 16.h, 22.5.w, 16.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.QRCARD),
                          child: Column(children: [
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
                        ),
                        Spacer(),
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
                        Spacer(),
                        Column(children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(91, 213, 193, .3),
                                  offset: Offset(0, 0),
                                  blurRadius: 7.0)
                            ]),
                            child: Image.asset(
                                "assets/images/group-message.png",
                                width: 38,
                                height: 38),
                          ),
                          SizedBox(height: 8),
                          Text("群发消息",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 14.sp))
                        ]),
                        Spacer(),
                        Column(children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(135, 193, 247, .3),
                                  offset: Offset(0, 1.5),
                                  blurRadius: 7.0)
                            ]),
                            child: Image.asset("assets/images/patient-plan.png",
                                width: 38, height: 38),
                          ),
                          SizedBox(height: 8),
                          Text("随访计划",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 14.sp))
                        ])
                      ],
                    ),
                  )),
                  SizedBox(height: 20.h),
                  Center(
                      child: Container(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    width: 343.w,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 16.w, right: 16.w),
                            height: 40.h,
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIconConstraints: BoxConstraints(
                                      maxWidth: 32.21.w, maxHeight: 11.71.h),
                                  prefixIcon: Padding(
                                      child: Image.asset(
                                          "assets/images/patient-search.png"),
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w)),
                                  suffixIcon: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(0)),
                                    child: Text("搜索",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16.sp)),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  prefixStyle:
                                      TextStyle(color: Color(0xFFD1D1D1)),
                                  hintText: "输入患者相关信息搜索",
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Color(0xFF999999)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFF2F8F8)),
                              maxLines: 1,
                            )),
                        SizedBox(height: 28.h),

                        Container(
                            padding: EdgeInsets.only(left: 16.w, right: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 6.w,
                                      height: 14.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1.5.r)),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF5AD8B2),
                                                Color(0xFF4CD9EE),
                                              ])),
                                    ),
                                    SizedBox(width: 4.5.w),
                                    Text("患者分组",
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 17.sp))
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => Get.toNamed(Routes.GROUP_MANAGE),
                                  child: Container(
                                    width: 85.w,
                                    height: 26.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(2, 212, 194, 0.07),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.5.r))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/patient-group.png",
                                            width: 12.15.w,
                                            height: 12.15.h),
                                        SizedBox(width: 4.w),
                                        Text("分组管理",
                                            style: TextStyle(
                                                color: Color(0xFF09DCCA),
                                                fontSize: 14.sp))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),

                        SizedBox(height: 10.h),
                        Container(
                            child: Column(
                          children: [
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
                                        padding: EdgeInsets.fromLTRB(
                                            16.w, 12.h, 16.w, 12.h),
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
                                    expanded: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.h, bottom: 10.h),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF5F8F8)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          for (var _ in Iterable.generate(5))
                                            expandItem(),
                                        ],
                                      ),
                                    ),
                                    // builder: (_, collapsed, expanded) {
                                    //   return Padding(
                                    //     padding: EdgeInsets.only(
                                    //         left: 10, right: 10, bottom: 10),
                                    //     child: Expandable(
                                    //       collapsed: collapsed,
                                    //       expanded: expanded,
                                    //       theme: const ExpandableThemeData(
                                    //           crossFadePoint: 0),
                                    //     ),
                                    //   );
                                    // },
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
                                        padding: EdgeInsets.fromLTRB(
                                            16.w, 12.h, 16.w, 12.h),
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
                                    expanded: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF5F8F8)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          for (var _ in Iterable.generate(5))
                                            expandItem(),
                                        ],
                                      ),
                                    ),
                                    // builder: (_, collapsed, expanded) {
                                    //   return Padding(
                                    //     padding: EdgeInsets.only(
                                    //         left: 10, right: 10, bottom: 10),
                                    //     child: Expandable(
                                    //       collapsed: collapsed,
                                    //       expanded: expanded,
                                    //       theme: const ExpandableThemeData(
                                    //           crossFadePoint: 0),
                                    //     ),
                                    //   );
                                    // },
                                  ),
                                ),
                              ],
                            ))
                          ],
                        )),
                        Container(
                          alignment: Alignment.center,
                          height: 30.h,
                          child: Text("共196名患者",
                              style: TextStyle(
                                  color: Color(0xFF999999), fontSize: 13.sp)),
                        )
                        // Column(
                        //   children: [
                        //     SizedBox(height: 104.h),
                        //     Image.asset("assets/images/patient-empty.png",
                        //         width: 111.w, height: 130.h),
                        //     SizedBox(height: 20.h),
                        //     Text("暂无内容",
                        //         style: TextStyle(
                        //             color: Color(0xFF999999), fontSize: 14.sp)),
                        //     SizedBox(height: 111.h),
                        //   ],
                        // )
                      ],
                    ),
                  )),
                  Container(
                    alignment: Alignment.center,
                    height: 56.5.h,
                    child: Text("— 没有更多内容啦 —",
                        style: TextStyle(
                            color: Color(0xFFC7C7C7), fontSize: 13.sp)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
