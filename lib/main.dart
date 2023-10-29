import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:little_walk/screens/add_dog.dart';
import 'package:go_router/go_router.dart';
import 'package:little_walk/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  final future = const FlutterSecureStorage().read(key: "AUTH_TOKEN");
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Text("请稍后...");
        }
        if (snapshot.data == null) {
          return const LoginScreen(60);
        }
        return MaterialApp(
            home: Scaffold(
          body: const Text("test"),
          bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.amber[400]),
                    label: "首页"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.handshake,
                      color: Colors.amber[400],
                    ),
                    label: "代遛"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.sports,
                      color: Colors.amber[400],
                    ),
                    label: "邀请"),
                BottomNavigationBarItem(
                    icon: Icon(
                      color: Colors.amber[400],
                      Icons.portrait,
                    ),
                    label: "个人"),
              ],
              selectedItemColor: Colors.amber[800],
              currentIndex: selectedIndex,
              onTap: (idx) {
                setState(() => selectedIndex = idx);
              }),
        ));
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
