import 'package:get/get.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:flutter_dev/ui/auth/auth.dart';
import 'package:flutter_dev/controllers/binding/binding.dart';

class Routes {
  // this is to prevent anyone from instantiating this object
  Routes._();

  static const INITIAL = '/';
  static const SPLASH = '/splash';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const PROFILE = '/profile';
  static const HOME = '/home';
  static const SETTINGS = '/settings';
  static const RESET_PASSWORD = '/reset-password';
  static const UPDATE_PROFILE = '/update-profile';

  // demo
  static const AUDIO = '/audio';
  static const WAVE = '/wave';
  static const CHATS = '/chats';

  static final routes = [
    GetPage(
      name: SPLASH,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(name: SIGNIN, page: () => SignIn()),
    GetPage(name: SIGNUP, page: () => SignUp()),
    GetPage(name: HOME, page: () => Home()),
    GetPage(name: SETTINGS, page: () => Settings()),
    GetPage(name: RESET_PASSWORD, page: () => ResetPassword()),
    GetPage(name: UPDATE_PROFILE, page: () => UpdateProfile()),
    GetPage(name: AUDIO, page: () => SimpleRecorder()),
    GetPage(name: WAVE, page: () => WaveDemo()),
    GetPage(name: CHATS, page: () => ChatHome()),
  ];
}
