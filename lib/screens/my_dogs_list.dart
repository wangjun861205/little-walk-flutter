import 'dart:js';

import 'package:flutter/material.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/screens/login.dart';
import '../models/dog.dart';

class MyDogsList extends StatelessWidget {
  var future;

  @override
  Widget build(BuildContext context) {
    future = () async {
      final authToken = await getAuthToken();
      if (authToken == null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const LoginScreen(60);
        }));
      }
      return await myDogs(authToken!);
    };
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          return LoginScreen(60);
        });
  }
}
