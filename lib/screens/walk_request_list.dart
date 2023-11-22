import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/pagination.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/walk_request_list.dart';

class WalkRequestListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageBloc = BlocProvider.of<PaginationCubit>(context);
    return FutureBuilder(
        future: nearbyWalkRequests([], 20),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(),
                body: const Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasError) {
            return Scaffold(
                appBar: AppBar(),
                body: Center(child: Text("${snapshot.error}")));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Scaffold(
                appBar: AppBar(), body: const Center(child: Text("暂无数据")));
          }
          return BlocProvider(
              create: (_) => WalkRequestListCubit(snapshot.data!),
              child: Scaffold(appBar: AppBar(), body: WalkRequestList()));
        });
  }
}
