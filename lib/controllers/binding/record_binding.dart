import 'package:get/get.dart';

import '../record_controller.dart';

class RecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordController>(() => RecordController());
  }
}
