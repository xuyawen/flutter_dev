import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';
import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';

class ChoosePatient extends StatefulWidget {
  ChoosePatient({Key key}) : super(key: key);

  @override
  _ChoosePatientState createState() => _ChoosePatientState();
}

class _ChoosePatientState extends State<ChoosePatient> {
  List<ContactInfo> _contacts = [];
  double susItemHeight = 40;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //加载联系人列表
    rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        _contacts.add(ContactInfo.fromJson(v));
      });
      _handleList(_contacts);
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(_contacts);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(_contacts);

    // add topList.
    // contactList.insertAll(0, topList);

    setState(() {});
  }

  Decoration getIndexBarDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey[300], width: .5));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
          actions: [
            Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          overlayColor:
                              MaterialStateProperty.all(Color(0xFF9EEEE7)),
                          side: MaterialStateProperty.all(
                              BorderSide(color: Color(0xFF02D4C2), width: 1)),
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            //设置按下时的背景颜色
                            // if (states.contains(MaterialState.pressed)) {
                            //   return Colors.blue[200];
                            // }
                            //默认不使用背景颜色
                            return Colors.white;
                          })),
                      onPressed: () => Get.back(),
                      child: Text("完成",
                          style: TextStyle(
                              color: Color(0xFF02D4C2),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold))),
                ))
          ],
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("选择成员", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          color: Color(0xFFF3F9F8),
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
              Expanded(
                child: AzListView(
                  data: _contacts,
                  itemCount: _contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    ContactInfo model = _contacts[index];
                    return getWeChatListItem(
                      context,
                      model,
                      defHeaderBgColor: Color(0xFFE5E5E5),
                    );
                  },
                  physics: BouncingScrollPhysics(),
                  susItemBuilder: (BuildContext context, int index) {
                    ContactInfo model = _contacts[index];
                    return getSusItem(context, model.getSuspensionTag());
                  },
                  indexBarItemHeight: 12.h,
                  indexBarAlignment: Alignment.topRight,
                  indexBarData: [...kIndexBarData],
                  indexBarMargin: EdgeInsets.all(10),
                  indexBarOptions: IndexBarOptions(
                    needRebuild: true,
                    ignoreDragCancel: true,
                    downTextStyle:
                        TextStyle(fontSize: 12.sp, color: Colors.white),
                    downItemDecoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFF31ADFF)),
                    indexHintWidth: 50,
                    indexHintHeight: 50,
                    indexHintDecoration: BoxDecoration(
                        color: Color(0xFF02D4C2), shape: BoxShape.circle),
                    indexHintAlignment: Alignment.centerRight,
                    indexHintChildAlignment: Alignment(0.0, 0.0),
                    indexHintOffset: Offset(-20, 0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;

  Color bgColor;
  IconData iconData;

  String img;
  String id;
  String firstletter;

  ContactInfo({
    this.name,
    this.tagIndex,
    this.namePinyin,
    this.bgColor,
    this.iconData,
    this.img,
    this.id,
    this.firstletter,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        id = json['id']?.toString(),
        firstletter = json['firstletter'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'img': img,
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}

Widget getWeChatListItem(
  BuildContext context,
  ContactInfo model, {
  double susHeight = 40,
  Color defHeaderBgColor,
}) {
  return GestureDetector(
    onTap: () {},
    child: getcheckBoxItem(context, model),
  );
}

Widget getSusItem(BuildContext context, String tag) {
  return Container(
    height: 30.h,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 16.0),
    color: Color(0xFFF3F9F8),
    alignment: Alignment.centerLeft,
    child: Text(
      '$tag',
      softWrap: false,
      style: TextStyle(
        fontSize: 14.0,
        color: Color(0xFF999999),
      ),
    ),
  );
}

Widget getcheckBoxItem(BuildContext context, ContactInfo model) {
  // DecorationImage image;
  return checkBoxItem();
}

Widget checkBoxItem() {
  return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 16.w, right: 12.w),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset("assets/images/unselect.png", width: 20.w, height: 20.h),
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
                  SizedBox(width: 20.w),
                  Text("神经根型颈椎病",
                      style:
                          TextStyle(color: Color(0xFF999999), fontSize: 13.sp))
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
