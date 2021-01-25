import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/ui.dart';

class ChatHome extends StatefulWidget {
  ChatHome({Key key}) : super(key: key);

  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final TextEditingController _textController = new TextEditingController();
  final List<Map<String, String>> messageList = [
    {
      "type": "self",
      "time": "12:05:00",
      "message": "ok.",
      "avatar": "A",
    },
    {
      "type": "othe",
      "time": "11:59:00",
      "message": "I hope tomorrow",
      "avatar": "B",
    },
    {
      "type": "self",
      "time": "11:55:00",
      "message": "When will i get a job?",
      "avatar": "A",
    },
  ];

  void _handleSubmitted(String text) {
    setState(() {
      // messageList.add();
      messageList.insert(0, {
        "type": "self",
        "time": "12:05:00",
        "message": text,
        "avatar": "A",
      });
    });
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
              new Container(
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
              chatBody(messageList),
              new Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                padding: const EdgeInsets.only(left: 20, right: 5),
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: new Row(
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        decoration: new InputDecoration(
                            prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
                            hintText: "what?",
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
                    new Container(
                      child: new IconButton(
                        icon: new Icon(
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

Widget chatBody(List<Map<String, String>> list) {
  return new Flexible(
      child: new ListView.builder(
          itemCount: list.length,
          padding: new EdgeInsets.fromLTRB(16, 0, 16, 30),
          reverse: true,
          itemBuilder: (context, index) {
            return list[index]["type"] == 'self'
                ? Row(
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
                                        list[index]["time"],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(list[index]["message"]),
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
                          child: Text(list[index]["avatar"]),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          bottom: 8.0,
                          right: 8.0,
                        ),
                        child: CircleAvatar(
                          child: Text(list[index]["avatar"]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: CustomPaint(
                                painter: Triangle(),
                              ),
                            ),
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
                                        list[index]["time"],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(list[index]["message"]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          }));
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
