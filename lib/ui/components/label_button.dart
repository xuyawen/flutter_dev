import 'package:flutter/material.dart';
/*
LabelButton(
  labelText: 'Some Text',
  onPressed: () => print('implement me'),
),
*/

class LabelButton extends StatelessWidget {
  LabelButton({this.labelText, this.onPressed});
  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.only(top: 0.0))),
      child: Text(
        labelText,
        style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ),
      onPressed: onPressed,
    );
  }
}
