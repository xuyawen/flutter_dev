import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class MassMessage extends StatelessWidget {
  const MassMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        title: Text("群发消息",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
        actions: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10.h, 16.w, 10.h),
              child: SizedBox(
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      //设置按下时的背景颜色
                      // if (states.contains(MaterialState.pressed)) {
                      //   return Colors.blue[200];
                      // }
                      //默认不使用背景颜色
                      return Color(0xFFE3E8EB);
                    })),
                    onPressed: () {},
                    child: Text("导入历史群发",
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold))),
              ))
        ],
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16.w, right: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text("输入群发内容",
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                    Image.asset("assets/images/title-decorate.png",
                        width: 47.w, height: 13.h),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        child: Text("可发送文字、语音、图片，量表等消息，批量发送给患者。以下内容至少填写编辑一项。",
                            style: TextStyle(color: Color(0xFF999999)))),
                    SizedBox(height: 25.h),
                    Divider(height: 1.h, color: Color(0xFFECECEC)),
                    SizedBox(height: 25.h),
                    decorateTitle("文字内容"),
                    SizedBox(height: 10.h),
                    SizedBox(
                        height: 127.h,
                        child: Stack(
                          children: [
                            Positioned(
                                child: TextField(
                              maxLength: 300,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  prefixStyle:
                                      TextStyle(color: Color(0xFFD1D1D1)),
                                  hintText: "请在这里输入您要发送给患者的信息",
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Color(0xFF999999)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFE3E3E3), width: 0.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFE3E3E3), width: 0.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  filled: true,
                                  counterText: "",
                                  fillColor: Color(0xFFFFFFFF)),
                              maxLines: 300,
                            )),
                            Positioned(
                                bottom: 10.h,
                                right: 10.w,
                                child: Text(
                                  "已输入0/300",
                                  style: TextStyle(
                                      color: Color(0xFFC1C1C1),
                                      fontSize: 12.sp),
                                ))
                          ],
                        )),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        decorateTitle("语音"),
                        ElevatedButton(
                            onPressed: () async {
                              await Get.bottomSheet(recorderSheet(),
                                  barrierColor: Colors.transparent,
                                  useRootNavigator: true);
                              print("close sheet");
                            },
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 14)),
                                elevation: MaterialStateProperty.all(0),
                                overlayColor: MaterialStateProperty.all(
                                    Color(0xFF9EEEE7)),
                                side: MaterialStateProperty.all(BorderSide(
                                    color: Color(0xFF02D4C2), width: 1)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  //设置按下时的背景颜色
                                  // if (states.contains(MaterialState.pressed)) {
                                  //   return Colors.blue[200];
                                  // }
                                  //默认不使用背景颜色
                                  return Color(0xFFFFFFFF);
                                })),
                            child: Row(
                              children: [
                                Icon(Icons.mic,
                                    color: Color(0xFF00BFAF), size: 18),
                                Text("录制语音",
                                    style: TextStyle(color: Color(0xFF00BFAF)))
                              ],
                            ))
                      ],
                    ),
                    Wrap(
                      runSpacing: 8.h,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 145.w,
                              height: 20.h,
                              padding: EdgeInsets.only(left: 8.w),
                              decoration: BoxDecoration(
                                  color: Color(0xFF19D5BB),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.0))),
                              child: Row(
                                children: [
                                  Text("32",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(width: 5.w),
                                  Icon(Icons.signal_cellular_4_bar_outlined,
                                      size: 15, color: Colors.white)
                                ],
                              ),
                            ),
                            ImageIcon(
                              AssetImage("assets/images/delete-patient.png"),
                              size: 16,
                              color: Color(0xFFBCBCBC),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 145.w,
                              height: 20.h,
                              padding: EdgeInsets.only(left: 8.w),
                              decoration: BoxDecoration(
                                  color: Color(0xFF19D5BB),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.0))),
                              child: Row(
                                children: [
                                  Text("18",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(width: 5.w),
                                  Icon(Icons.signal_cellular_4_bar_outlined,
                                      size: 15, color: Colors.white)
                                ],
                              ),
                            ),
                            ImageIcon(
                              AssetImage("assets/images/delete-patient.png"),
                              size: 16,
                              color: Color(0xFFBCBCBC),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    decorateTitle("图片"),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: [
                            Container(
                              width: 107,
                              height: 107,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Image.asset("assets/images/qrcode.png"),
                            ),
                            Container(
                              width: 107,
                              height: 107,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Image.asset("assets/images/qrcode.png"),
                            ),
                            Container(
                              width: 107,
                              height: 107,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Image.asset("assets/images/qrcode.png"),
                            ),
                            DottedBorder(
                              color: Color(0xFFCCCCCC),
                              borderType: BorderType.RRect,
                              child: ClipRRect(
                                child: Container(
                                  height: 107,
                                  width: 107,
                                  child: Icon(Icons.add,
                                      color: Color(0xFFD4D4D4), size: 35.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: ScreenUtil().screenWidth,
                          child: Text(
                            "已添加0/6",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Color(0xFFC1C1C1), fontSize: 12.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        decorateTitle("量表"),
                        ElevatedButton(
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 14)),
                                elevation: MaterialStateProperty.all(0),
                                overlayColor: MaterialStateProperty.all(
                                    Color(0xFF9EEEE7)),
                                side: MaterialStateProperty.all(BorderSide(
                                    color: Color(0xFF02D4C2), width: 1)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  //设置按下时的背景颜色
                                  // if (states.contains(MaterialState.pressed)) {
                                  //   return Colors.blue[200];
                                  // }
                                  //默认不使用背景颜色
                                  return Color(0xFFFFFFFF);
                                })),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.star_border,
                                    color: Color(0xFF00BFAF), size: 18),
                                Text("添加量表",
                                    style: TextStyle(color: Color(0xFF00BFAF)))
                              ],
                            ))
                      ],
                    ),
                    Wrap(
                      runSpacing: 8.h,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 1.h),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Color(0xFF333333)))),
                              child: Text("《肌张力  PROM评定量表》",
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14.sp,
                                  )),
                            ),
                            ImageIcon(
                              AssetImage("assets/images/delete-patient.png"),
                              size: 16,
                              color: Color(0xFFBCBCBC),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 1.h),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Color(0xFF333333)))),
                              child: Text("《肌张力  PROM评定量表》",
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14.sp,
                                  )),
                            ),
                            ImageIcon(
                              AssetImage("assets/images/delete-patient.png"),
                              size: 16,
                              color: Color(0xFFBCBCBC),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            )),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.CHOOSEGROUP),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 64.h,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.select_all, color: Colors.white),
                    SizedBox(width: 10.w),
                    Text("选择患者",
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

Widget decorateTitle(String title) {
  return Row(
    children: [
      Container(
        width: 6.w,
        height: 14.h,
        decoration: BoxDecoration(color: Color(0xFF09CFBE)),
      ),
      SizedBox(width: 4.w),
      Text(title,
          style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold))
    ],
  );
}

Widget recorderSheet() {
  RecordController c = Get.put(RecordController());
  return Container(
    height: 237.5.h,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(198, 219, 214, .34),
          offset: Offset(0, 0),
          blurRadius: 28.0)
    ]),
    child: Column(
      children: [
        SizedBox(height: 30.h),
        Text("按住说话",
            style: TextStyle(color: Color(0xFF666666), fontSize: 16.sp)),
        SizedBox(height: 5.5.h),
        // Text("按下麦克风开始录音",
        //     style: TextStyle(color: Color(0xFF999999), fontSize: 14.sp)),
        Text("00:00",
            style: TextStyle(color: Color(0xFF333333), fontSize: 15.sp)),
        SizedBox(height: 9.h),
        // Image.asset("assets/images/microphone-wait.png", width: 83, height: 83),
        Wrap(
          spacing: 30.w,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Image.asset(Utils.assetsPath("microphone-reset"),
                width: 60, height: 60),
            GestureDetector(
                onTap: () => c.running.value = !c.running.value,
                child: Obx(
                  () => Image.asset(
                      c.running.value
                          ? Utils.assetsPath("microphone-stop")
                          : Utils.assetsPath("microphone-run"),
                      width: 83,
                      height: 83),
                )),
            Image.asset(Utils.assetsPath("microphone-right"),
                width: 60, height: 60),
          ],
        ),
        SizedBox(height: 5.h),
        Obx(() => Wave(running: c.running.value))
      ],
    ),
  );
}
