// import 'package:get/get.dart';
// import '../net/repository_adapter.dart';
// import '../net/cases_model.dart';

// class HomeController extends GetxController {
//   HomeController({this.homeRepository});

//   /// inject repo abstraction dependency
//   final IHomeRepository homeRepository;

//   /// When the controller is initialized, make the http request
//   @override
//   void onInit() {
//     super.onInit();
//     // show loading on start, data on success
//     // and error message on error with 0 boilerplate
//     homeRepository.getCases().then((data) {
//       change(data, status: RxStatus.success());
//     }, onError: (err) {
//       change(null, status: RxStatus.error(err.toString()));
//     });
//   }

//   @override
//   void onReady() {
//     print('The build method is done. '
//         'Your controller is ready to call dialogs and snackbars');
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     print('onClose called');
//     super.onClose();
//   }

//   @override
//   void didChangeMetrics() {
//     print('the window size did change');
//     super.didChangeMetrics();
//   }

//   @override
//   void didChangePlatformBrightness() {
//     print('platform change ThemeMode');
//     super.didChangePlatformBrightness();
//   }

//   @override
//   Future<bool> didPushRoute(String route) {
//     print('the route $route will be open');
//     return super.didPushRoute(route);
//   }

//   @override
//   Future<bool> didPopRoute() {
//     print('the current route will be closed');
//     return super.didPopRoute();
//   }

//   @override
//   void onDetached() {
//     print('onDetached called');
//   }

//   @override
//   void onInactive() {
//     print('onInative called');
//   }

//   @override
//   void onPaused() {
//     print('onPaused called');
//   }

//   @override
//   void onResumed() {
//     print('onResumed called');
//   }
// }