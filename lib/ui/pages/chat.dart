import 'package:flutter/material.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff2c8cde),
              Color(0xffb1e9e4),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Flexible(
                  child: ListView.builder(
                      itemCount: _messageList.length,
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
                      reverse: true,
                      itemBuilder: (context, index) => _messageList[index])),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                padding: const EdgeInsets.only(left: 20, right: 5),
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                            hintText: "input message",
                            hintStyle: TextStyle(
                                fontSize: 14, color: Color(0xFFD1D1D1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                            ),
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Color(0xff2139b1),
                        ),
                        onPressed: () => _handleSubmitted(_textController.text),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "12:05:00",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(text),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CustomPaint(
                    painter: Triangle(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: CircleAvatar(
              child: Text("Me"),
            ),
          ),
        ],
      ),
    );
  }
}

class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;

    var path = Path();
    path.lineTo(10, 0);
    path.lineTo(0, -10);
    path.lineTo(-10, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



// item["type"] == 'self'
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Stack(
//                     children: <Widget>[
//                       DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   item["time"],
//                                   textAlign: TextAlign.end,
//                                   style: TextStyle(
//                                     fontSize: 11,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(item["message"]),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 0,
//                         bottom: 0,
//                         child: CustomPaint(
//                           painter: Triangle(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 8.0,
//                     bottom: 8.0,
//                     right: 8.0,
//                   ),
//                   child: CircleAvatar(
//                     child: Text(item["avatar"]),
//                   ),
//                 ),
//               ],
//             )
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 8.0,
//                     bottom: 8.0,
//                     right: 8.0,
//                   ),
//                   child: CircleAvatar(
//                     child: Text(item["avatar"]),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         left: 0,
//                         bottom: 0,
//                         child: CustomPaint(
//                           painter: Triangle(),
//                         ),
//                       ),
//                       DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   item["time"],
//                                   textAlign: TextAlign.end,
//                                   style: TextStyle(
//                                     fontSize: 11,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(item["message"]),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )