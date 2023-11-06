import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:little_walk/apis/auth.dart';
import 'package:little_walk/screens/add_dog.dart';
import 'package:little_walk/screens/home.dart';
import 'package:little_walk/screens/login.dart';
import 'package:little_walk/screens/profile_menu.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
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
  final future = needLogin();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
              home: Scaffold(body: Center(child: Text("${snapshot.error}"))));
        }
        if (!snapshot.hasData) {
          return const MaterialApp(home: Scaffold(body: Text("请稍后")));
        }
        if (snapshot.data!) {
          return const MaterialApp(home: LoginScreen(60));
        }
        return const MaterialApp(home: HomeScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
