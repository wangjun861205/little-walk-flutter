import 'dart:js';

import 'package:flutter/material.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/screens/login.dart';
import '../models/dog.dart';

class MyDogsList extends StatelessWidget {
  Future<List<Dog>> query() async {
    final authToken = await getAuthToken();
    if (authToken == null) {}
    return await myDogs(authToken!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myDogs(""),
        builder: (context, snapshot) {
          return LoginScreen(60);
        });
  }
}
