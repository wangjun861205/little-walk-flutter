import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/models/dog.dart';

class WalkRequestCreate {
  List<String> dogIDs;
  String shouldStartAfter;
  String shouldStartBefore;
  String shouldEndAfter;
  String shouldEndBefore;

  WalkRequestCreate(
      {required this.dogIDs,
      required this.shouldStartAfter,
      required this.shouldStartBefore,
      required this.shouldEndAfter,
      required this.shouldEndBefore});

  WalkRequestCreate clone() {
    return WalkRequestCreate(
        dogIDs: dogIDs,
        shouldStartAfter: shouldStartAfter,
        shouldStartBefore: shouldStartBefore,
        shouldEndAfter: shouldEndAfter,
        shouldEndBefore: shouldEndBefore);
  }

  factory WalkRequestCreate.empty() {
    return WalkRequestCreate(
        dogIDs: [],
        shouldStartAfter: "",
        shouldStartBefore: "",
        shouldEndAfter: "",
        shouldEndBefore: "");
  }
}

class WalkRequestCreateCubit extends Cubit<WalkRequestCreate> {
  WalkRequestCreateCubit() : super(WalkRequestCreate.empty());

  void setDogIDs(List<String> dogIDs) {
    state.dogIDs = dogIDs;
    emit(state);
  }

  void setShouldStartAfter(String time) {
    state.shouldStartAfter = time;
    emit(state);
  }

  void setShouldStartBefore(String time) {
    state.shouldStartBefore = time;
    emit(state);
  }

  void setShouldEndAfter(String time) {
    state.shouldEndAfter = time;
    emit(state);
  }

  void setShouldEndBefore(String time) {
    state.shouldEndBefore = time;
    emit(state);
  }
}

class WalkRequest {
  Dog dog;
  String shouldStartAfter;
  String shouldStartBefore;
  String shouldEndAfter;
  String shouldEndBefore;

  WalkRequest(
      {required this.dog,
      required this.shouldStartAfter,
      required this.shouldStartBefore,
      required this.shouldEndAfter,
      required this.shouldEndBefore});

  factory WalkRequest.fromJSON(Map<String, dynamic> json) {
    return WalkRequest(
        dog: Dog.fromJSON(json["dog"]),
        shouldStartAfter: json["should_start_after"],
        shouldStartBefore: json["should_start_before"],
        shouldEndAfter: json["should_end_after"],
        shouldEndBefore: json["should_end_before"]);
  }
}

class WalkRequestListCubit extends Cubit<List<WalkRequest>> {
  WalkRequestListCubit(List<WalkRequest> init) : super(init);

  void append(List<WalkRequest> list) {
    var curr = state;
    curr.addAll(list);
    emit(curr);
  }
}
