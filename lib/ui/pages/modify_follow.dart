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
    final List<double> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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
        color: Color(0xFFFFFFFF),
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
                    Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Column(
                        children: [
                          TimelineNode(
                            style: TimelineNodeStyle(
                                pointType: TimelineNodePointType.Circle,
                                pointColor: Color(0xFF66E1D7),
                                lineType: TimelineNodeLineType.Full,
                                lineColor: Color(0xFF66E1D7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _followHead(),
                                SizedBox(height: 16.h),
                                Utils.text("随访执行时间", Color(0xFF333333),
                                    size: 14.sp, weight: FontWeight.bold),
                                SizedBox(height: 10.h),
                                _followTime(),
                                SizedBox(height: 14.h),
                                _textFollow(),
                                SizedBox(height: 30.h)
                              ],
                            ),
                          ),
                          TimelineNode(
                            style: TimelineNodeStyle(
                                pointType: TimelineNodePointType.Circle,
                                pointColor: Color(0xFF66E1D7),
                                lineType: TimelineNodeLineType.Full,
                                lineColor: Color(0xFF66E1D7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _followHead(),
                                SizedBox(height: 16.h),
                                Utils.text("随访执行时间", Color(0xFF333333),
                                    size: 14.sp, weight: FontWeight.bold),
                                SizedBox(height: 10.h),
                                _followTime(),
                                SizedBox(height: 14.h),
                                _questionnaireScale(),
                                SizedBox(height: 30.h)
                              ],
                            ),
                          ),
                          TimelineNode(
                            isLast: true,
                            style: TimelineNodeStyle(
                                pointType: TimelineNodePointType.Circle,
                                pointColor: Color(0xFF66E1D7),
                                lineType: TimelineNodeLineType.Full,
                                lineColor: Color(0xFF66E1D7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _followHead(),
                                SizedBox(height: 16.h),
                                Utils.text("随访执行时间", Color(0xFF333333),
                                    size: 14.sp, weight: FontWeight.bold),
                                SizedBox(height: 10.h),
                                _followTime(),
                                SizedBox(height: 14.h),
                                _selectFollowTask(),
                                SizedBox(height: 30.h),
                              ],
                            ),
                          ),
                          _addNextFollow(),
                          SizedBox(height: 45.h)
                        ],
                      ),
                    )
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
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.GIVEFOLLOW),
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chooseTemplateTypeSheet() {
    return Container(
      height: 251.5.h,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(198, 219, 214, .34),
            offset: Offset(0, 0),
            blurRadius: 28.0)
      ]),
      child: Column(
        children: [
          SizedBox(height: 19.h),
          Utils.text("随访类型", Color(0xFF666666),
              size: 17.sp, weight: FontWeight.bold),
          SizedBox(height: 17.5.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Utils.text("文字随访", Color(0xFF666666),
                size: 15.sp, align: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Utils.text("问卷量表", Color(0xFF666666),
                size: 15.sp, align: TextAlign.center),
          ),
          Container(
            height: 10.h,
            color: Color(0xFFF5F5F2),
          ),
          GestureDetector(
            excludeFromSemantics: true,
            onTap: () => Get.back(),
            child: Container(
              width: ScreenUtil().screenWidth,
              color: Colors.white,
              height: 57.h,
              child: Center(
                  child: Utils.text("取消", Color(0xFF999999),
                      size: 15.sp, align: TextAlign.center)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addNextFollow() {
    return SizedBox(
      width: 184.w,
      height: 42.5.h,
      child: ElevatedButton(
          onPressed: () async {
            await Get.bottomSheet(_chooseTemplateTypeSheet(),
                barrierColor: Colors.transparent, useRootNavigator: true);
          },
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(Color(0xFF9EEEE7)),
              side: MaterialStateProperty.all(
                  BorderSide(color: Color(0xFF00BFAF), width: 1)),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                //设置按下时的背景颜色
                // if (states.contains(MaterialState.pressed)) {
                //   return Colors.blue[200];
                // }
                //默认不使用背景颜色
                return Color(0xFFFFFFFF);
              })),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Color(0xFF00BFAF), size: 28),
              SizedBox(width: 5.w),
              Utils.text("添加下次随访任务", Color(0xFF00BFAF),
                  size: 16.sp, weight: FontWeight.bold)
            ],
          )),
    );
  }

  Widget _textFollow() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color(0xFFF5F8F8),
        border: Border.all(color: Color(0xFFD8D8D8), width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Image.asset(Utils.assetsPath("remove-icon"),
                    width: 24.w, height: 24.h),
                SizedBox(width: 6.w),
                Utils.text("文字随访", Color(0xFF666666),
                    size: 14.sp, weight: FontWeight.bold),
              ],
            ),
          ),
          SizedBox(
              height: 127.h,
              child: Stack(
                children: [
                  Positioned(
                      child: TextField(
                    maxLength: 300,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                        hintText:
                            "患者朋友们你们好，明天将有一次免费的公益面诊活动。活动地址在上海徐汇医院门诊部二楼。活动时间为上午9:00~11:30，欢迎大家到时前来咨询。",
                        hintStyle: TextStyle(
                            fontSize: 13.sp, color: Color(0xFF999999)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFDED38E), width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFDED38E), width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        filled: true,
                        counterText: "",
                        fillColor: Color(0xFFF9F8F1)),
                    maxLines: 300,
                  )),
                  Positioned(
                      bottom: 10.h,
                      right: 10.w,
                      child: Text(
                        "已输入0/300",
                        style: TextStyle(
                            color: Color(0xFFC1C1C1), fontSize: 12.sp),
                      ))
                ],
              ))
        ],
      ),
    );
  }

  Widget _followTime() {
    return Row(
      children: [
        SizedBox(
          width: 90.w,
          height: 36.h,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                hintText: "2",
                hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xFF999999)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Color(0xFFFFFFFF)),
            maxLines: 1,
          ),
        ),
        SizedBox(width: 6.w),
        SizedBox(
          width: 70.w,
          height: 36.h,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                suffixIcon: Icon(Icons.arrow_drop_down,
                    size: 35.sp, color: Color(0xFFACACAC)),
                prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                hintText: "天",
                hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xFF999999)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Color(0xFFFFFFFF)),
            maxLines: 1,
          ),
        ),
        SizedBox(width: 23.w),
        SizedBox(
          width: 120.w,
          height: 36.h,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                suffixIcon: Icon(Icons.arrow_drop_down,
                    size: 35.sp, color: Color(0xFFACACAC)),
                prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                hintText: "6:23 AM",
                hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xFF999999)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Color(0xFFFFFFFF)),
            maxLines: 1,
          ),
        )
      ],
    );
  }

  Widget _followHead() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Utils.text("第一次随访任务", Color(0xFF333333),
            size: 16.sp, weight: FontWeight.bold),
        Row(children: [
          Image.asset(Utils.assetsPath("remove-icon"),
              width: 24.w, height: 24.h),
          SizedBox(width: 6.w),
          Utils.text("删除任务", Color(0xFF666666), size: 14.sp),
        ])
      ],
    );
  }

  Widget _questionnaireScale() {
    return Container(
        width: 323.w,
        decoration: BoxDecoration(
          color: Color(0xFFF5F8F8),
          border: Border.all(color: Color(0xFFD8D8D8), width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Image.asset(Utils.assetsPath("remove-icon"),
                      width: 24.w, height: 24.h),
                  SizedBox(width: 6.w),
                  Utils.text("问卷量表", Color(0xFF666666),
                      size: 14.sp, weight: FontWeight.bold),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: DottedBorder(
                radius: Radius.circular(8),
                color: Color(0xFFCCCCCC),
                borderType: BorderType.RRect,
                child: ClipRRect(
                  child: Container(
                    width: 140.w,
                    height: 35.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Color(0xFFD4D4D4), size: 20.sp),
                        SizedBox(width: 5.w),
                        Utils.text("添加量表", Color(0xFF666666), size: 14.sp)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 1.h),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xFF00BFAF)))),
                    child: Text("《肌张力  PROM评定量表》",
                        style: TextStyle(
                          color: Color(0xFF00BFAF),
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
            )
          ],
        ));
  }

  Widget _selectFollowTask() {
    return Container(
      width: 323.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xFFF5F8F8),
        border: Border.all(color: Color(0xFFD8D8D8), width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 90.w),
        child: DottedBorder(
          radius: Radius.circular(8),
          color: Color(0xFFCCCCCC),
          borderType: BorderType.RRect,
          child: ClipRRect(
            child: Container(
              width: 140.w,
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Color(0xFFD4D4D4), size: 20.sp),
                  SizedBox(width: 5.w),
                  Utils.text("添加随访任务", Color(0xFF666666), size: 14.sp)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeLine extends StatelessWidget {
  const TimeLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: VerticalDivider(color: Colors.red),
    );
  }
}
