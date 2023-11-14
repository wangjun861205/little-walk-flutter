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

  WalkRequest clone() {
    return WalkRequest(
        dog: dog,
        shouldStartAfter: shouldStartAfter,
        shouldStartBefore: shouldStartBefore,
        shouldEndAfter: shouldEndAfter,
        shouldEndBefore: shouldEndBefore);
  }
}
