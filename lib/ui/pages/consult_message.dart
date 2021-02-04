import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class ConsultMessage extends StatelessWidget {
  const ConsultMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        title: Text("咨询消息",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Color(0xFFF5F8F8),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 12.h,
                  children: [
                    for (var _ in Iterable.generate(20))
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.CHATS),
                        child: messageItem(_),
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
      ),
    );
  }

  Widget messageItem(int _) {
    return Container(
      width: 343.w,
      height: 67.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: SizedBox(
                    width: 43,
                    height: 43,
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          "assets/images/qrcode.png",
                        ))),
              ),
              Positioned(
                  top: -8,
                  right: -8,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFFB5F25),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("$_",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold))
                        ],
                      )))
            ],
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("韩蕾蕾",
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "这是一条消息文字这是一条消息文字这是一这是一条消息文字这是一条消息文字这是一",
                      style:
                          TextStyle(color: Color(0xFF333333), fontSize: 13.sp),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )),
                Positioned(
                    top: 0.h,
                    right: 0.w,
                    child: Text("13:12",
                        style: TextStyle(
                            color: Color(0xFF999999), fontSize: 11.sp)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
