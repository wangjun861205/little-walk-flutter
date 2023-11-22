import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/models/dog.dart';

class WalkRequest {
  List<Dog> dogs;
  DateTime shouldStartAfter;
  DateTime shouldStartBefore;
  DateTime shouldEndAfter;
  DateTime shouldEndBefore;

  WalkRequest(
      {required this.dogs,
      required this.shouldStartAfter,
      required this.shouldStartBefore,
      required this.shouldEndAfter,
      required this.shouldEndBefore});

  factory WalkRequest.empty() {
    final now = DateTime.now();
    return WalkRequest(
        dogs: [],
        shouldStartAfter: now,
        shouldStartBefore: now,
        shouldEndAfter: now,
        shouldEndBefore: now);
  }

  factory WalkRequest.fromJSON(Map<String, dynamic> json) {
    return WalkRequest(
      dogs: (json["dogs"] as List<Map<String, dynamic>>)
          .map((d) => Dog.fromJSON(d))
          .toList(),
      shouldStartAfter: DateTime.parse(json["should_start_after"]),
      shouldStartBefore: DateTime.parse(json["should_start_before"]),
      shouldEndAfter: DateTime.parse(json["should_end_after"]),
      shouldEndBefore: DateTime.parse(json["should_end_before"]),
    );
  }
}

class WalkRequestCubit extends Cubit<WalkRequest> {
  WalkRequestCubit() : super(WalkRequest.empty());

  void setDogIDs(List<Dog> dogs) {
    state.dogs = dogs;
    emit(state);
  }

  void setShouldStartAfter(DateTime time) {
    state.shouldStartAfter = time;
    emit(state);
  }

  void setShouldStartBefore(DateTime time) {
    state.shouldStartBefore = time;
    emit(state);
  }

  void setShouldEndAfter(DateTime time) {
    state.shouldEndAfter = time;
    emit(state);
  }

  void setShouldEndBefore(DateTime time) {
    state.shouldEndBefore = time;
    emit(state);
  }
}
