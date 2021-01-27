import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';

class AddGroup extends StatelessWidget {
  const AddGroup({Key key}) : super(key: key);

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
        title: Text("新建分组", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Color(0xFFF3F9F8),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight -
                    110.h -
                    ScreenUtil().statusBarHeight,
                child: SingleChildScrollView(
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, top: 16.h, bottom: 12.h),
                          child: Text("分组名称",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 16.sp))),
                      Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 16.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                                prefixStyle:
                                    TextStyle(color: Color(0xFFD1D1D1)),
                                hintText: "输入分组名称",
                                hintStyle: TextStyle(
                                    fontSize: 13.sp, color: Color(0xFF999999)),
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
                                fillColor: Color(0xFFFFFFFF)),
                            maxLines: 1,
                          )),
                      SizedBox(height: 36.h),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, top: 16.h, bottom: 12.h),
                          child: Text("成员",
                              style: TextStyle(
                                  color: Color(0xFF333333), fontSize: 16.sp))),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 16.h),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: ScreenUtil().screenWidth,
                          constraints: BoxConstraints(minHeight: 144.5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Wrap(
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.CHOOSEPATIENT),
                                child: DottedBorder(
                                  color: Color(0xFFCCCCCC),
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(50),
                                  child: ClipRRect(
                                    child: Container(
                                      height: 50.h,
                                      width: 50.w,
                                      child: Icon(Icons.add,
                                          color: Color(0xFFD4D4D4),
                                          size: 28.sp),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: 64.h,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 10.w),
                        Text("保存分组",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.sp))
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                      Color(0xFF58DCB4),
                      Color(0xFF4CD9EE),
                    ])),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
