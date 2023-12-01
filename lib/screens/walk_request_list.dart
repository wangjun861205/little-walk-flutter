import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/list.dart';
import 'package:little_walk/blocs/pagination.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:little_walk/components/walk_request_list.dart';
import 'package:little_walk/screens/create_walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/process_indicator.dart';

class NearbyWalkRequestsScreen extends StatelessWidget {
  int size;

  NearbyWalkRequestsScreen({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    final pageBloc = PaginationCubit(Pagination(page: 1, size: size));
    final listBloc = ListCubit<WalkRequest>([]);
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: pageBloc),
          BlocProvider.value(value: listBloc)
        ],
        child: FutureBuilder(future: () async {
          final requests = await nearbyWalkRequests(1, pageBloc.state.size);
          if (requests.isNotEmpty) {
            listBloc.append(requests);
          }
        }(), builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorBoundary(error: snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const ProcessIndicatorScreen();
          }
          return Scaffold(
              appBar: AppBar(actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => WalkRequestCubit(),
                                child: const CreateWalkRequestScreen(),
                              )));
                    },
                    icon: const Icon(Icons.add))
              ]),
              body: RefreshIndicator(
                  child: WalkRequestList(requests: listBloc.state),
                  onRefresh: () async {
                    nearbyWalkRequests(
                            pageBloc.state.page + 1, pageBloc.state.size)
                        .then((requests) {
                      if (requests.isNotEmpty) {
                        pageBloc.setPage(pageBloc.state.page + 1);
                        listBloc.append(requests);
                      }
                    }).catchError((e) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ErrorBoundary(error: e.toString());
                      }));
                    });
                  }));
        }));
  }
}
