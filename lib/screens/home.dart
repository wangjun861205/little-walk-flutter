import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:little_walk/screens/location_picker.dart';
import 'package:little_walk/screens/profile_menu.dart';
import 'package:little_walk/screens/walk_request_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final pages = [
      BlocProvider.value(
          value: BlocProvider.of<AppCubit>(context),
          child: const ProfileMenuScreen()),
      LocationPickerScreen(),
      BlocProvider(
          create: (_) => FutureCubit<List<WalkRequest>, int>(
              initData: [],
              factory: (prev, arg) async {
                final curr = await nearbyWalkRequests(arg, 10);
                return [...(prev ?? []), ...curr];
              },
              arg: 1),
          child: const WalkRequestListScreen()),
      const ProfileMenuScreen(),
    ];

    return BlocProvider(
        create: (_) => ScreenIndexCubit(),
        child: BlocBuilder<ScreenIndexCubit, int>(
            builder: (context, i) => Scaffold(
                  body: pages[i],
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
                      currentIndex: i,
                      onTap: (idx) => BlocProvider.of<ScreenIndexCubit>(context)
                          .setIndex(idx)),
                )));
  }
}
