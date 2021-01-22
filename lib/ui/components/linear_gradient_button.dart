import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * 登录注册的绿色长条形按钮
 * text 按钮为文字内容
 * top为按钮距离顶部控件的高度
 */
class LinearGradientButton extends StatefulWidget {
  final String text;
  final double top;
  final VoidCallback onTap;

  const LinearGradientButton(
      {Key key, @required this.text, this.top = 0, this.onTap})
      : super(key: key);

  @override
  _LinearGradientButtonState createState() => _LinearGradientButtonState();
}

class _LinearGradientButtonState extends State<LinearGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(widget.top)),
      child: Material(
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(44.0)),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xFF58DCB4),
              Color(0xFF4CD9EE),
            ]),
            borderRadius: BorderRadius.circular(ScreenUtil().setHeight(44.0)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(ScreenUtil().setHeight(44.0)),
            onTap: widget.onTap,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50.0.h,
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0.ssp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
