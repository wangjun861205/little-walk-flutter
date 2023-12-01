import 'package:flutter/material.dart';

class ProcessIndicatorScreen extends StatelessWidget {
  const ProcessIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("请稍后"),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("全力加载中...")],
            )
          ]),
        ));
  }
}
