import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/blocs/list.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:little_walk/components/walk_request_list.dart';
import 'package:little_walk/screens/create_walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';

class WalkRequestListScreen extends StatelessWidget {
  const WalkRequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final futureBloc = BlocProvider.of<FutureCubit<List<WalkRequest>, int>>(
        context,
        listen: true);
    switch (futureBloc.state.result.status) {
      case LoadStatus.error:
        return ErrorBoundary(error: futureBloc.state.result.error.toString());
      case LoadStatus.loading:
        return const Center(child: CircularProgressIndicator());
      default:
        return Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => WalkRequestValueCubit(),
                              child: const CreateWalkRequestScreen(),
                            )));
                  },
                  icon: const Icon(Icons.add))
            ]),
            body: RefreshIndicator(
                child: BlocProvider(
                    create: (_) => ListCubit(
                        futureBloc.state.result.data as List<WalkRequest>),
                    child: const WalkRequestList()),
                onRefresh: () async {
                  futureBloc.setArg(futureBloc.state.arg += 1);
                }));
    }
  }
}
