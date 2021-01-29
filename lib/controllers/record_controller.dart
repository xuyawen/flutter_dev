import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_dev/ui/auth/auth.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:flutter_dev/ui/components/components.dart';

enum RecordStatus {
  wait,
  run,
  stop,
  play,
}

class RecordController extends GetxController {
  RxBool running = false.obs;

  RecordStatus status = RecordStatus.wait;

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
