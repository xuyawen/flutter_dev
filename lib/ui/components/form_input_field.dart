import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
FormInputField(
                controller: _url,
                labelText: 'Post URL',
                validator: Validator.notEmpty,
                keyboardType: TextInputType.multiline,
                minLines: 3,
                onChanged: (value) => print('changed'),
                onSaved: (value) => print('implement me'),
              ),
*/

class FormInputField extends StatelessWidget {
  FormInputField(
      {this.controller,
      this.labelText,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.minLines = 1,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.onSaved});

  final TextEditingController controller;
  final String labelText;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final Icon prefixIcon;
  final Icon suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixStyle: TextStyle(color: Color(0xFFD1D1D1)),
          hintText: labelText,
          hintStyle: TextStyle(fontSize: 14.ssp, color: Color(0xFFD1D1D1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
          filled: true,
          fillColor: Colors.white),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: null,
      minLines: minLines,
      validator: validator,
    );
  }
}
