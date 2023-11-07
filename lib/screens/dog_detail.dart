import 'package:flutter/material.dart';
import 'package:little_walk/models/dog.dart';

class DogDetailScreen extends StatelessWidget {
  final Dog dog;
  const DogDetailScreen(this.dog, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 80, left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dog.name),
                              Text(dog.gender),
                              Text(dog.breed.name)
                            ],
                          )))
                ],
              )),
          Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.15,
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 115,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("从相册中选择",
                                          style: TextStyle(fontSize: 16))),
                                  const Divider(),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("拍摄",
                                          style: TextStyle(fontSize: 16)))
                                ],
                              ));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)));
                  },
                  child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.cyan[800],
                      child: const Text("不二")))),
          Positioned(
              top: 60,
              right: MediaQuery.of(context).size.width * 0.15,
              child: TextButton(onPressed: () {}, child: const Text("编辑信息")))
        ]));
  }
}
