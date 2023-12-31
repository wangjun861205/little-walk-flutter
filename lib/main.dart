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

void main() async {
  await dotenv.load();
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  // final status = await [Permission.locationAlways].request();
  // debugPrint(status[Permission.locationAlways].toString());
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

Future<bool> needLogin() async {
  final token = await const FlutterSecureStorage().read(key: "AUTH_TOKEN");
  if (token == null) {
    return true;
  }
  return await verifyToken(token) == null ? true : false;
}

class MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  final future = const FlutterSecureStorage().read(key: "AUTH_TOKEN");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        FirebaseMessaging.onMessage.listen((event) {
          debugPrint(event.from);
          debugPrint(event.category);
          debugPrint(event.data.toString());
        });
        if (snapshot.hasError) {
          return MaterialApp(
              home: Scaffold(body: Center(child: Text("${snapshot.error}"))));
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(home: Scaffold(body: Text("请稍后")));
        }
        final appCubit = AppCubit(
            backendAddress: dotenv.get("BACKEND_ADDRESS"),
            authToken: snapshot.data);
        if (snapshot.data == null) {
          return BlocProvider.value(
              value: appCubit, child: const MaterialApp(home: LoginScreen(60)));
        }
        return BlocProvider.value(
            value: appCubit, child: const MaterialApp(home: HomeScreen()));
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String backendAddress;
  const MyHomePage(
      {super.key, required this.title, required this.backendAddress});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? breed;

  void setBreed(String? b) {
    setState(() {
      breed = b;
    });
  }

  List<String> tags = [];

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
    });
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  String? gender;

  void setGender(String? gender) {
    setState(() {
      this.gender = gender;
    });
  }

  DateTime? birthday;
  void setBirthday(DateTime? birthday) {
    setState(() {
      this.birthday = birthday;
    });
  }

  String? portrait;
  void setPortrait(String portrait) {
    setState(() {
      portrait = portrait;
    });
  }

  @override
  Widget build(BuildContext context) => const AddDogScreen();
}
