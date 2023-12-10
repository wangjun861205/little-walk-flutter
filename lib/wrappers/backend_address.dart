import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BackendAddressWrapper extends StatelessWidget {
  final Widget Function(BuildContext, String) builder;

  const BackendAddressWrapper({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    final backendAddress = dotenv.get("BACKEND_ADDRESS");
    return builder(context, backendAddress);
  }
}
