import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
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

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
              child: Image.asset(
            "./assets/images/qrcode.png",
            width: 80.0,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "远行",
              textScaleFactor: 1.2,
            ),
          ),
          Text("+86 182-286-44678"),
        ],
      ),
    );
  }

  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: susItemHeight,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            '$susTag',
            textScaleFactor: 1.2,
          ),
          Expanded(
              child: Divider(
            height: .0,
            indent: 10.0,
          ))
        ],
      ),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[700],
            child: Text(
              model.name[0],
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(model.name),
          onTap: () {
            print("OnItemClick: $model");
            Navigator.pop(context, model);
          },
        )
      ],
    );
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
                      style: ButtonStyle(backgroundColor:
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
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                        suffixIcon: Icon(Icons.lens),
                        prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                        hintText: "输入患者相关信息搜索",
                        hintStyle: TextStyle(
                            fontSize: 13.sp, color: Color(0xFF999999)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        filled: true,
                        fillColor: Color(0xFFFFFFFF)),
                    maxLines: 1,
                  )),
              Container(
                color: Color(0xFFFFFFFF),
                child: ,
              )
            ],
          ),
        ),
      ),
    );
  }
}

String getImgPath(String name, {String format: 'png'}) {
  return 'assets/images/$name.$format';
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
//        'id': id,
        'name': name,
        'img': img,
//        'firstletter': firstletter,
//        'tagIndex': tagIndex,
//        'namePinyin': namePinyin,
//        'isShowSuspension': isShowSuspension
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
  return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Offstage(
//          offstage: !(model.isShowSuspension == true),
//          child: getSusItem(context, model.getSuspensionTag(),
//              susHeight: susHeight),
//        ),
//        getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor),
//      ],
//    );
}

Widget getWeChatItem(
  BuildContext context,
  ContactInfo model, {
  Color defHeaderBgColor,
}) {
  DecorationImage image;
//    if (model.img != null && model.img.isNotEmpty) {
//      image = DecorationImage(
//        image: CachedNetworkImageProvider(model.img),
//        fit: BoxFit.contain,
//      );
//    }
  return ListTile(
    leading: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4.0),
        color: model.bgColor ?? defHeaderBgColor,
        image: image,
      ),
      child: model.iconData == null
          ? null
          : Icon(
              model.iconData,
              color: Colors.white,
              size: 20,
            ),
    ),
    title: Text(model.name),
    onTap: () {
      //LogUtil.e("onItemClick : $model");
      // Utils.showSnackBar(context, 'onItemClick : ${model.name}');
    },
  );
}

Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
  if (tag == '★') {
    tag = '★ 热门城市';
  }
  return Container(
    height: susHeight,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 16.0),
    color: Color(0xFFF3F4F5),
    alignment: Alignment.centerLeft,
    child: Text(
      '$tag',
      softWrap: false,
      style: TextStyle(
        fontSize: 14.0,
        color: Color(0xFF666666),
      ),
    ),
  );
}
