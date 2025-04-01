import 'package:firebase_core/firebase_core.dart';
import 'package:users_app_flutter/firebase_options.dart';

class FirebaseInitializer {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    // await requestPermission();
  }

  // static requestPermission() async {
  //   final FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   final NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );
  //   print("push notification status ${settings.authorizationStatus}");
  // }
}
