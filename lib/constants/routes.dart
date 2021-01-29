import 'package:flutter_dev/controllers/binding/record_binding.dart';
import 'package:flutter_dev/controllers/controllers.dart';
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
  static const RESET_PASSWORD = '/reset-password';
  static const HOME = '/home';
  static const QRCARD = '/qr-card';
  static const PATIENTGROUP = '/patient-group';
  static const SETTINGS = '/settings';
  static const UPDATE_PROFILE = '/update-profile';
  static const GROUP_MANAGE = '/group_manage';
  static const MODIFYGROUP = '/modify_group';
  static const CHOOSEPATIENT = '/choose_patient';
  static const PATIENTDETAIL = '/patient_detail';
  static const MASSMESSAGE = '/mass_message';
  static const CHOOSEGROUP = '/choose_group';
  static const HISTORYMASS = '/history_mass';
  static const FOLLOWPLAN = '/follow_plan';
  static const FOLLOWTEMPLATE = '/follow_template';
  static const CONSULTMESSAGE = '/consult_message';
  static const MODIFYFOLLOW = '/modify_follow';

  // demo
  static const AUDIO = '/audio';
  static const WAVE = '/wave';
  static const CHATS = '/chats';

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(name: SIGNIN, page: () => SignIn(), binding: AuthBinding()),
    GetPage(name: SIGNUP, page: () => SignUp()),
    GetPage(name: HOME, page: () => Home()),
    GetPage(name: SETTINGS, page: () => Settings()),
    GetPage(name: RESET_PASSWORD, page: () => ResetPassword()),
    GetPage(name: UPDATE_PROFILE, page: () => UpdateProfile()),
    GetPage(name: QRCARD, page: () => QRcard()),
    GetPage(name: PATIENTGROUP, page: () => PatientGroup()),
    GetPage(name: GROUP_MANAGE, page: () => GroupManage()),
    GetPage(name: MODIFYGROUP, page: () => ModifyGroup()),
    GetPage(name: CHOOSEPATIENT, page: () => ChoosePatient()),
    GetPage(name: PATIENTDETAIL, page: () => PatientDetail()),
    GetPage(name: MASSMESSAGE, page: () => MassMessage()),
    GetPage(name: CHOOSEGROUP, page: () => ChooseGroup()),
    GetPage(name: HISTORYMASS, page: () => HistoryMass()),
    GetPage(name: FOLLOWPLAN, page: () => FollowPlan()),
    GetPage(name: FOLLOWTEMPLATE, page: () => FollowTemplate()),
    GetPage(name: CONSULTMESSAGE, page: () => ConsultMessage()),
    GetPage(name: MODIFYFOLLOW, page: () => ModifyFollow()),
    // demo
    GetPage(name: AUDIO, page: () => SimpleRecorder()),
    GetPage(name: WAVE, page: () => WaveDemo(), binding: RecordBinding()),
    GetPage(name: CHATS, page: () => ChatHome()),
  ];
}
