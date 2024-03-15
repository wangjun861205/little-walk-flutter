import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:little_walk/apis/auth.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/screens/add_dog.dart';
import 'package:little_walk/screens/home.dart';
import 'package:little_walk/screens/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Config {
  static String? backendAddress;
}

class AuthToken {
  static String? token;
}

class CurrentLocation {
  static double? longitude;
  static double? latitude;
}

void main() async {
  await dotenv.load();
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  Config.backendAddress = backendAddress;
  // final status = await [Permission.locationAlways].request();
  // debugPrint(status[Permission.locationAlways].toString());
  final authToken = await const FlutterSecureStorage().read(key: "AUTH_TOKEN");
  AuthToken.token = authToken;
  BackgroundLocation.setAndroidNotification(
    title: "Notification title",
    message: "Notification message",
    icon: "@mipmap/ic_launcher",
  );
  BackgroundLocation.setAndroidConfiguration(1000);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.requestPermission(provisional: true);
  final deviceToken = await FirebaseMessaging.instance.getToken();
  debugPrint(deviceToken);
  runApp(MyApp(backendAddress));
}

class MyApp extends StatefulWidget {
  final String backendAddress;
  const MyApp(this.backendAddress, {super.key});
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    if (AuthToken.token == null) {
      return const LoginScreen();
    }
    return const MaterialApp(home: HomeScreen());
  }
}
