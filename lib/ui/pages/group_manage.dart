import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';

class GroupManage extends StatelessWidget {
  const GroupManage({Key key}) : super(key: key);

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
        title: Text("分组管理", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Color(0xFFF3F9F8),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
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
                              expanded: GestureDetector(
                                onTap: () => Get.toNamed(Routes.PATIENTDETAIL),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 10.h),
                                  decoration:
                                      BoxDecoration(color: Color(0xFFF5F8F8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      for (var _ in Iterable.generate(20))
                                        expandItem(),
                                    ],
                                  ),
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
                              expanded: GestureDetector(
                                onTap: () => Get.toNamed(Routes.PATIENTDETAIL),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 10.h),
                                  decoration:
                                      BoxDecoration(color: Color(0xFFF5F8F8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      for (var _ in Iterable.generate(20))
                                        expandItem(),
                                    ],
                                  ),
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
            )),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.MODIFYGROUP),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 64.h,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 10.w),
                    Text("新建分组",
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
          ],
        ),
      ),
    );
  }
}
