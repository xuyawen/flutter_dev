import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class PushController extends GetxController {
  final JPush jpush = new JPush();
  String debugLable = 'Unknown'; /*错误信息*/

  void init() {
    ///debug就填debug:true，我这是生产环境所以production:true
    jpush.setup(
        appKey: 'c6ba446997f1beaa91b49535',
        channel: 'developer-default',
        production: false,
        debug: false);

    /// 监听jpush
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));
    jpush.addEventHandler(
      onReceiveNotification: (Map<String, dynamic> message) async {
        print('onReceiveNotification: $message');
      },
      onOpenNotification: (Map<String, dynamic> message) async {
        /// 点击通知栏消息，在此时通常可以做一些页面跳转等
        print('onOpenNotification: $message');
      },
    );
  }

  void pushMessage() {
    /*三秒后出发本地推送*/
    var fireDate = DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch + 1000);
    var localNotification = LocalNotification(
      id: 234,
      title: '我是推送测试标题wwwwwwwww',
      buildId: 1,
      content: '看到了说明已经成功了hahahaha',
      fireTime: fireDate,
      subtitle: '一个测试qqqqqqqq',
    );
    jpush.sendLocalNotification(localNotification).then((res) {
      print('sendLocalNotification: $res');
      debugLable = res;
    });
  }
}
