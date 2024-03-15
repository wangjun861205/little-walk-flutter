import 'package:flutter/material.dart';

class ErrorBoundary extends StatelessWidget {
  final Object error;
  final Function() retry;

  const ErrorBoundary({required this.error, required this.retry, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Flexible(child: Text(error.toString()))]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () => retry.call(), child: const Text("重试"))
          ],
        )
      ],
    )));
  }
}
