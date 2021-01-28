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
  final LinearGradient linearGradient;

  const LinearGradientButton(
      {Key key,
      @required this.text,
      this.top = 0,
      this.onTap,
      this.linearGradient})
      : super(key: key);

  @override
  _LinearGradientButtonState createState() => _LinearGradientButtonState();
}

class _LinearGradientButtonState extends State<LinearGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.top.h),
      child: Material(
        borderRadius: BorderRadius.circular(44.0.r),
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xFFCCCCCC),
            gradient: widget.linearGradient,
            borderRadius: BorderRadius.circular(44.0.r),
          ),
          child: InkWell(
            // highlightColor: Color(0xFF58DCB4),
            splashColor: Color(0xFF58DCB4),
            borderRadius: BorderRadius.circular(44.0.r),
            onTap: widget.onTap,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50.0.h,
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
