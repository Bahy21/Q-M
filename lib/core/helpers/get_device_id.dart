import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDeviceId {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String?> get deviceId async {
   return await messaging.getToken();
  }
}