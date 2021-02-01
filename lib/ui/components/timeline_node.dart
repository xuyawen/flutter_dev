import 'package:flutter/material.dart';

enum TimelineNodeType { Left, Right }
enum TimelineNodePointType { None, Circle }
enum TimelineNodeLineType { None, Full, TopHalf, BottomHalf }

class TimelineNodeStyle {
  TimelineNodeType type;
  TimelineNodePointType pointType;
  Color pointColor;
  double pointRadius;
  TimelineNodeLineType lineType;
  Color lineColor;
  double lineWidth;
  double preferredWidth;

  TimelineNodeStyle(
      {this.type = TimelineNodeType.Left,
      this.pointType = TimelineNodePointType.None,
      this.pointColor = Colors.blue,
      this.pointRadius = 6,
      this.lineType = TimelineNodeLineType.None,
      this.lineColor = Colors.blue,
      this.lineWidth = 1,
      this.preferredWidth = 50});
}

class TimelineNode extends StatefulWidget {
  final TimelineNodeStyle style;
  final Widget child;
  final bool isLast;

  TimelineNode({Key key, this.style, this.child, this.isLast = false})
      : super(key: key);

  _TimelineNodeState createState() => _TimelineNodeState();
}

class _TimelineNodeState extends State<TimelineNode> {
  Widget layout() {
    Widget nodeLine = Container(
      width: this.widget.style.preferredWidth,
      height: double.infinity,
      child: CustomPaint(
        painter: TimelineNodeLinePainter(
            style: this.widget.style, isLast: this.widget.isLast),
      ),
    );
    Widget nodeContent = Expanded(child: this.widget.child);
    List<Widget> nodeRowChildren = [];
    switch (this.widget.style.type) {
      case TimelineNodeType.Left:
        nodeRowChildren.add(nodeLine);
        nodeRowChildren.add(nodeContent);
        break;
      case TimelineNodeType.Right:
        nodeRowChildren.add(nodeContent);
        nodeRowChildren.add(nodeLine);
        break;
    }
    return IntrinsicHeight(
      child: Row(
        children: nodeRowChildren,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return layout();
  }
}

class TimelineNodeLinePainter extends CustomPainter {
  TimelineNodeStyle style;
  bool isLast = false;

  TimelineNodeLinePainter({this.style, this.isLast});

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint();
    linePaint.color = this.style.lineColor;
    linePaint.strokeWidth = this.style.lineWidth;
    switch (this.style.lineType) {
      case TimelineNodeLineType.None:
        break;
      case TimelineNodeLineType.Full:
        canvas.drawLine(Offset(size.width / 2, 0),
            Offset(size.width / 2, size.height), linePaint);
        break;
      case TimelineNodeLineType.TopHalf:
        canvas.drawLine(Offset(size.width, 0),
            Offset(size.width / 2, size.height / 2), linePaint);
        break;
      case TimelineNodeLineType.BottomHalf:
        canvas.drawLine(Offset(size.width / 2, 0),
            Offset(size.width / 2, size.height), linePaint);
        break;
    }

    Paint _createPaint(Color color) {
      Paint pointPaint = Paint();
      return pointPaint..color = color;
    }

    // 外圆
    canvas.drawCircle(Offset(size.width / 2, 0), 9,
        _createPaint(Color.fromRGBO(2, 212, 194, 0.25)));
    // 内圆
    canvas.drawCircle(
        Offset(size.width / 2, 0), 5, _createPaint(Color(0xFF02D4C2)));

    if (isLast) {
      // 最后一项
      // 外圆
      canvas.drawCircle(Offset(size.width / 2, size.height), 9,
          _createPaint(Color.fromRGBO(2, 212, 194, 0.25)));
      // 内圆
      canvas.drawCircle(Offset(size.width / 2, size.height), 5,
          _createPaint(Color(0xFF02D4C2)));
    }
  }

  @override
  bool shouldRepaint(TimelineNodeLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TimelineNodeLinePainter oldDelegate) => false;
}
