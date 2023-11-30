import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/walk_request.dart';

// class WalkRequest {
//   List<Dog> dogs;
//   DateTime shouldStartAfter;
//   DateTime shouldStartBefore;
//   DateTime shouldEndAfter;
//   DateTime shouldEndBefore;

//   WalkRequest(
//       {required this.dogs,
//       required this.shouldStartAfter,
//       required this.shouldStartBefore,
//       required this.shouldEndAfter,
//       required this.shouldEndBefore});

//   factory WalkRequest.empty() {
//     final now = DateTime.now();
//     return WalkRequest(
//         dogs: [],
//         shouldStartAfter: now,
//         shouldStartBefore: now,
//         shouldEndAfter: now,
//         shouldEndBefore: now);
//   }

//   factory WalkRequest.fromJSON(Map<String, dynamic> json) {
//     return WalkRequest(
//       dogs: (json["dogs"] as List<Map<String, dynamic>>)
//           .map((d) => Dog.fromJSON(d))
//           .toList(),
//       shouldStartAfter: DateTime.parse(json["should_start_after"]),
//       shouldStartBefore: DateTime.parse(json["should_start_before"]),
//       shouldEndAfter: DateTime.parse(json["should_end_after"]),
//       shouldEndBefore: DateTime.parse(json["should_end_before"]),
//     );
//   }
// }

class WalkRequestCubit extends Cubit<WalkRequest> {
  WalkRequestCubit() : super(const WalkRequest());

  void setDogs(List<Dog> dogs) {
    emit(state.copyWith(dogs: dogs));
  }

  void setLongitude(double longitude) {
    emit(state.copyWith(longitude: longitude));
  }

  void setLatitude(double latitude) {
    emit(state.copyWith(latitude: latitude));
  }
}

class WalkRequestListCubit extends Cubit<List<WalkRequest>> {
  WalkRequestListCubit() : super([]);

  void append(List<WalkRequest> list) {
    state.addAll(list);
    emit(state);
  }
}
