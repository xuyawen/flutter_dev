import 'package:flutter/material.dart';

Widget hideKeyboardScaffold(BuildContext context, Widget child) {
  return Scaffold(
    // Global GestureDetector that will dismiss the keyboard
    body: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: child,
    ),
  );
}
