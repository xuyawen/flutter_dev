import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dev/ui/components/components.dart';
import 'package:flutter_dev/controllers/binding/binding.dart';
import 'package:flutter_dev/ui/ui.dart';

void main() async {
  await GetStorage.init();
  Get.put(AuthController());
  // Get.put(PushController()).init();

  runApp(App());
}

class AppController extends GetxController {
  static AppController get to => Get.find();
  final name = 'app'.obs;
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        builder: (_) => Loading(
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.INITIAL,
                getPages: Routes.routes,
                theme: Themes.lightTheme,
                darkTheme: Themes.darkTheme,
                themeMode: ThemeMode.system,
                defaultTransition: Transition.zoom,
                initialBinding: SplashBinding(),
                builder: hideKeyboardScaffold,
                home: Splash(),
              ),
            ));
  }
}
