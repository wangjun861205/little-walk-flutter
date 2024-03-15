import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/post.dart';
import 'package:little_walk/components/compounds/post_tile.dart';
import 'package:little_walk/screens/create_post.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/loading.dart';
import 'package:little_walk/screens/login.dart';

class PostListScreen extends StatelessWidget {
  final posts = PostsCubit()..query();
  PostListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: posts,
        child: Builder(
          builder: (context) {
            final posts = BlocProvider.of<PostsCubit>(context, listen: true);
            if (posts.state.isLoading) {
              return const LoadingScreen();
            }
            if (posts.state.error != null) {
              if (posts.state.error is DioException) {
                if ((posts.state.error as DioException).error ==
                    errorUnauthorized) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                }
                return const Scaffold();
              }
              return ErrorBoundary(
                  error: posts.state.error!, retry: () => posts.query());
            }
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                shape: const CircleBorder(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreatePostScreen())),
                child: const Icon(Icons.add),
              ),
              body: ListView.builder(
                  itemCount: posts.state.result.length,
                  itemBuilder: (context, i) =>
                      PostTile(post: posts.state.result[i])),
            );
          },
        ));
  }
}
