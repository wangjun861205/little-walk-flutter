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
  WalkRequestCubit(WalkRequest req) : super(req);

  void setDog(List<Dog> dogs) {
    emit(state.copyWith(dogs: dogs));
  }

  void setLongitude(double longitude) {
    emit(state.copyWith(longitude: longitude));
  }

  void setLatitude(double latitude) {
    emit(state.copyWith(latitude: latitude));
  }

  void setAcceptedBy(String acceptedBy) {
    emit(state.copyWith(acceptedBy: acceptedBy));
  }

  void setAcceptedAt(DateTime acceptedAt) {
    emit(state.copyWith(acceptedAt: acceptedAt));
  }

  void setStartedAt(DateTime startedAt) {
    emit(state.copyWith(startedAt: startedAt));
  }

  void setFinishedAt(DateTime finishedAt) {
    emit(state.copyWith(startedAt: finishedAt));
  }

  void setCanceledAt(DateTime canceledAt) {
    emit(state.copyWith(startedAt: canceledAt));
  }
}

class WalkRequestListCubit extends Cubit<List<WalkRequest>> {
  WalkRequestListCubit() : super([]);

  void append(List<WalkRequest> list) {
    state.addAll(list);
    emit(state);
  }
}

class WalkRequestValueCubit extends Cubit<WalkRequestValue> {
  WalkRequestValueCubit() : super(const WalkRequestValue());

  void setDogs(List<Dog> dog) {
    emit(state.copyWith(dogs: dog));
  }

  void setLongitude(double longitude) {
    emit(state.copyWith(longitude: longitude));
  }

  void setLatitude(double latitude) {
    emit(state.copyWith(latitude: latitude));
  }
}
