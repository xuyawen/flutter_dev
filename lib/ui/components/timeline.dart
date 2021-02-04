import 'package:flutter/material.dart';

enum TimelineType { Left, Right }
enum TimelinePointType { None, Circle }
enum TimelineLineType { None, Full, TopHalf, BottomHalf }

class TimelineStyle {
  TimelineType type;
  TimelinePointType pointType;
  Color pointColor;
  double pointRadius;
  TimelineLineType lineType;
  Color lineColor;
  double lineWidth;
  double preferredWidth;

  TimelineStyle(
      {this.type = TimelineType.Left,
      this.pointType = TimelinePointType.None,
      this.pointColor = Colors.blue,
      this.pointRadius = 6,
      this.lineType = TimelineLineType.None,
      this.lineColor = Colors.blue,
      this.lineWidth = 1,
      this.preferredWidth = 25});
}

class Timeline extends StatefulWidget {
  final TimelineStyle style;
  final Widget child;
  final bool isLast;

  Timeline({Key key, this.style, this.child, this.isLast = false})
      : super(key: key);

  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  Widget layout() {
    Widget line = Container(
      width: this.widget.style.preferredWidth,
      height: double.infinity,
      child: CustomPaint(
        painter: TimelineLinePainter(
            style: this.widget.style, isLast: this.widget.isLast),
      ),
    );
    Widget content = Expanded(child: this.widget.child);
    List<Widget> rowChildren = [];
    switch (this.widget.style.type) {
      case TimelineType.Left:
        rowChildren.add(line);
        rowChildren.add(content);
        break;
      case TimelineType.Right:
        rowChildren.add(content);
        rowChildren.add(line);
        break;
    }
    return IntrinsicHeight(
      child: Row(
        children: rowChildren,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return layout();
  }
}

class TimelineLinePainter extends CustomPainter {
  TimelineStyle style;
  bool isLast = false;

  TimelineLinePainter({this.style, this.isLast});

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint();
    linePaint.color = this.style.lineColor;
    linePaint.strokeWidth = this.style.lineWidth;
    switch (this.style.lineType) {
      case TimelineLineType.None:
        break;
      case TimelineLineType.Full:
        canvas.drawLine(Offset(size.width / 2, 0),
            Offset(size.width / 2, size.height), linePaint);
        break;
      case TimelineLineType.TopHalf:
        canvas.drawLine(Offset(size.width, 0),
            Offset(size.width / 2, size.height / 2), linePaint);
        break;
      case TimelineLineType.BottomHalf:
        canvas.drawLine(Offset(size.width / 2, 0),
            Offset(size.width / 2, size.height), linePaint);
        break;
    }
  }

  @override
  bool shouldRepaint(TimelineLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TimelineLinePainter oldDelegate) => false;
}
