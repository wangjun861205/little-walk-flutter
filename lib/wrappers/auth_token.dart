import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/login.dart';

class AuthTokenWrapper extends StatelessWidget {
  final Widget Function(BuildContext, String) builder;

  const AuthTokenWrapper({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: const FlutterSecureStorage().read(key: "AUTH_TOKEN"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorBoundary(error: snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return const LoginScreen(60);
          }
          return builder(context, snapshot.data!);
        });
  }
}
