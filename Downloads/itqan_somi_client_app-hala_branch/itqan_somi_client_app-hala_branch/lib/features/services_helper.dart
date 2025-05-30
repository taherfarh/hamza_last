import 'package:client_app/core/common/local_storage/hive_services.dart';
import 'package:client_app/core/common/routes/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app.dart';

class FirebaseApi {
  // instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotifications() async {
    // request permission from user
    await _firebaseMessaging.requestPermission();

    // fetch firebase cloud messaging token for this device
    final fcmToken = await _firebaseMessaging.getToken();
    setGeneral("fcmToken", fcmToken.toString());
    print("Token: $fcmToken");
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(Routes.notification);
  }

  // function to initialize background settings
  Future initPushNotifications() async {
    // handle notifications if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}


