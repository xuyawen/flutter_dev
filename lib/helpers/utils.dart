import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static String assetsPath(String name,
      {String suffix: 'png', String type: 'images'}) {
    return 'assets/$type/$name.$suffix';
  }

  static Widget showSnackBar(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('A SnackBar has been shown.'),
          ),
        );
      },
      child: const Text('Show SnackBar'),
    );
  }

  static Widget text(String text, Color color,
      {FontWeight weight: FontWeight.normal, double size: 14}) {
    return Text(text,
        style: TextStyle(color: color, fontSize: size, fontWeight: weight));
  }
}
