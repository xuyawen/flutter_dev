import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class HistoryMass extends StatelessWidget {
  const HistoryMass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        title: Text("历史群发消息",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.5.h),
              child: Wrap(direction: Axis.vertical, spacing: 10.h, children: [
                for (var _ in Iterable.generate(5)) messageItem(),
                Container(
                  width: 343.w,
                  height: 62.h,
                  alignment: Alignment.center,
                  child: Text("— 没有更多内容啦 —",
                      style:
                          TextStyle(color: Color(0xFFC7C7C7), fontSize: 13.sp)),
                )
              ])),
        ),
      ),
    );
  }

  Widget messageItem() {
    return Container(
      width: 343.w,
      color: Color(0xFFF5F8F8),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(Utils.assetsPath("mail-icon"),
                  width: 30.w, height: 30.h),
              SizedBox(width: 8.w),
              Text("向28位患者群发了消息",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 12.5.h),
          Container(
            color: Color(0xFFEFF2F2),
            padding: EdgeInsets.all(8),
            child: Text(
                "患者朋友们你们好，明天将有一次免费的公益面诊活动。活动地址在上海徐汇医院门诊部二楼。活动时间为上午9:00~11:30，欢迎大家到时前来咨询。",
                style: TextStyle(color: Color(0xFF666666), fontSize: 14.sp)),
          ),
          SizedBox(height: 12.h),
          Wrap(
            direction: Axis.vertical,
            spacing: 8.h,
            children: [
              for (var _ in Iterable.generate(3)) recorderMessage(),
            ],
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 10.h,
            children: [
              for (var _ in Iterable.generate(4)) imageItem(),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.only(bottom: 1.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFF05A0B2)))),
            child: Text("《肌张力  PROM评定量表》",
                style: TextStyle(
                  color: Color(0xFF05A0B2),
                  fontSize: 14.sp,
                )),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("2020-12-31  15:23",
                  style: TextStyle(color: Color(0xFF999999), fontSize: 13.sp)),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 14.sp)),
                      elevation: MaterialStateProperty.all(0),
                      overlayColor:
                          MaterialStateProperty.all(Color(0xFF9EEEE7)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        //设置按下时的背景颜色
                        // if (states.contains(MaterialState.pressed)) {
                        //   return Colors.blue[200];
                        // }
                        //默认不使用背景颜色
                        return Color(0xFF07BE8B);
                      })),
                  child: Row(
                    children: [
                      Text("代入历史消息",
                          style: TextStyle(color: Color(0xFFFFFFFF))),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget recorderMessage() {
    return SizedBox(
      width: 122.w,
      height: 25.h,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14.sp)),
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(Color(0xFF9EEEE7)),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                //设置按下时的背景颜色
                // if (states.contains(MaterialState.pressed)) {
                //   return Colors.blue[200];
                // }
                //默认不使用背景颜色
                return Color(0xFF19D5BB);
              })),
          child: Row(
            children: [
              Text("32″", style: TextStyle(color: Color(0xFFFFFFFF))),
              SizedBox(width: 5.w),
              Image.asset(Utils.assetsPath("signal-03"),
                  width: 16.w, height: 16.h)
            ],
          )),
    );
  }

  Widget imageItem() {
    return Image.asset(Utils.assetsPath("microphone-run"),
        width: 71.w, height: 71.h);
  }
}
