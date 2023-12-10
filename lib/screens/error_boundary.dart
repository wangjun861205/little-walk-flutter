import 'package:flutter/material.dart';
import 'package:little_walk/screens/home.dart';

class ErrorBoundary extends StatelessWidget {
  final String error;

  const ErrorBoundary({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("出错了"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Flexible(child: Text(error))]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                    },
                    child: const Text("返回首页"))
              ],
            )
          ],
        )));
  }
}
