import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/wrappers/auth_token.dart';
import 'package:little_walk/wrappers/backend_address.dart';

class DogAvatar extends StatelessWidget {
  final double radius;
  const DogAvatar({this.radius = 50, super.key});
  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogCubit>(context);

    return BackendAddressWrapper(
        builder: (context, backendAddress) =>
            AuthTokenWrapper(builder: (context, authToken) {
              if (dogBloc.state.portraitID == null) {
                return CircleAvatar(
                    radius: radius,
                    backgroundColor: Colors.cyan[800],
                    child: Text(dogBloc.state.name));
              }

              return CircleAvatar(
                radius: radius,
                backgroundImage: NetworkImage(
                    "http://$backendAddress/apis/uploads/${dogBloc.state.portraitID}",
                    headers: {
                      "X-Auth-Token": authToken,
                    }),
              );
            }));
  }
}
