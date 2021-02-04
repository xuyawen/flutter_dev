import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/routes.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/helpers/helpers.dart';

class ChatHome extends StatefulWidget {
  ChatHome({Key key}) : super(key: key);

  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messageList = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
        text: text,
        animation: AnimationController(
          duration: Duration(milliseconds: 700),
          vsync: this,
        ));
    setState(() {
      _messageList.insert(0, message);
    });
    message.animation.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messageList) message.animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        title: Text("韩梅梅",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: ElevatedButton(
                style: ButtonStyle(
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14)),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0))),
                    overlayColor: MaterialStateProperty.all(Color(0xFF9EEEE7)),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Color(0xFF00BFAF), width: 1)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (_) => Color(0xFFF7FEFE))),
                onPressed: () {},
                child: Utils.text("患者档案", Color(0xFF00BFAF),
                    size: 14.sp, weight: FontWeight.bold)),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xFFF5F8F8)),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                  child: ListView.builder(
                      itemCount: _messageList.length,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      reverse: true,
                      itemBuilder: (context, index) => _messageList[index])),
              _chatFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chatFooter() {
    return Container(
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: Row(
              children: <Widget>[
                Image.asset(Utils.assetsPath("chat-microphone"),
                    width: 24, height: 24),
                SizedBox(width: 6.w),
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                        prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                        hintText: "您好医生，请问孩子最近控制情况.",
                        hintStyle: TextStyle(
                            fontSize: 14.sp, color: Color(0xFF666666)),
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
                        fillColor: Color(0xFFF5F8F8)),
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 6.w),
                Image.asset(Utils.assetsPath("chat-add"),
                    width: 24, height: 24),
                SizedBox(width: 6.w),
                Container(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 14)),
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0))),
                          overlayColor:
                              MaterialStateProperty.all(Color(0xFF9EEEE7)),
                          side: MaterialStateProperty.all(
                              BorderSide(color: Color(0xFF00BFAF), width: 1)),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (_) => Color(0xFF08CEBD))),
                      onPressed: () => _handleSubmitted(_textController.text),
                      child: Utils.text("发送", Color(0xFFFFFFFF),
                          size: 14.sp, weight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Divider(height: 1, color: Color(0xFFE2E2E2)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(Utils.assetsPath("chat-photo"),
                        width: 48.w, height: 48.h),
                    SizedBox(height: 5.h),
                    Utils.text("图片", Color(0xFF999999), size: 12)
                  ],
                ),
                SizedBox(width: 26.w),
                Column(
                  children: [
                    Image.asset(Utils.assetsPath("chat-scale"),
                        width: 48.w, height: 48.h),
                    SizedBox(height: 5.h),
                    Utils.text("发送量表", Color(0xFF999999), size: 12)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animation}) : super();

  final String text;
  final AnimationController animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animation, curve: Curves.easeInOutBack),
      axisAlignment: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _doctorTextMessage("fsdfdsf"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 43.w,
                height: 43.h,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      AssetImage(Utils.assetsPath("doctor-default")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _doctorTextMessage(String text) {
    return _messageWrap(
        Utils.text(text, Color(0xFFFFFFFF), size: 15.sp), Color(0xFF06C7A6));
  }

  // Widget _patientTextMessage(String text) {
  //   return _messageWrap(
  //       Utils.text(text, Color(0xFF333333), size: 15.sp), Color(0xFFFFFFFF));
  // }

  Widget _messageWrap(Widget content, Color color) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: content,
      ),
    );
  }
}

// class Triangle extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()..color = Colors.white;

//     var path = Path();
//     path.lineTo(10, 0);
//     path.lineTo(0, -10);
//     path.lineTo(-10, 0);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
