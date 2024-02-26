import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/dog_breed.dart';

class DogCubit extends Cubit<Dog> {
  DogCubit(Dog dog) : super(dog);

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  void setBreed(DogBreed breed) {
    emit(state.copyWith(breed: breed));
  }

  void setPortrait(String portraitID) {
    emit(state.copyWith(portraitID: portraitID));
  }
}

class DogValueCubit extends Cubit<DogValue> {
  DogValueCubit() : super(const DogValue());

  void setName(String? name) {
    emit(state.copyWith(name: name));
  }

  void setGender(String? gender) {
    emit(state.copyWith(gender: gender));
  }

  void setBreed(DogBreedValue? breed) {
    emit(state.copyWith(breed: breed));
  }

  void setPortrait(String? portraitID) {
    emit(state.copyWith(portraitID: portraitID));
  }

  void setBirthday(String? birthday) {
    emit(state.copyWith(birthday: birthday));
  }

  void setTags(List<String> tags) {
    emit(state.copyWith(tags: tags));
  }

  void removeTag(String tag) {
    emit(state.copyWith(
        tags: [...state.tags ?? List<String>.empty()]
            .where((t) => t != tag)
            .toList()));
  }

  void pushTag(String tag) {
    emit(state.copyWith(tags: [...state.tags ?? List<String>.empty(), tag]));
  }
}

class DogBreeds {
  String category;
  String breed;
  List<DogBreed> breeds;

  DogBreeds(this.category, this.breed, this.breeds);

  factory DogBreeds.empty() {
    return DogBreeds("", "", []);
  }
}

class DogBreedsCubit extends Cubit<List<DogBreed>> {
  DogBreedsCubit(List<DogBreed> breeds) : super(breeds);

  void set(List<DogBreed> breeds) {
    emit(breeds);
  }
}

class DogsCubit extends Cubit<List<Dog>> {
  DogsCubit(List<Dog> dogs) : super(dogs);

  void push(Dog dog) {
    emit([...state, dog]);
  }

  void remove(String id) => emit(state.where((d) => d.id != id).toList());
}

class MyDogsParams {
  final int limit;
  final String? after;

  const MyDogsParams({required this.limit, this.after});
}

class MyDogsCubit extends QueryCubit<MyDogsParams, List<Dog>> {
  MyDogsCubit({int limit = 20})
      : super(Query(
            params: MyDogsParams(limit: limit),
            result: [],
            query: ({required MyDogsParams params}) async =>
                await myDogs(limit: limit),
            nextParams: (
                {required MyDogsParams currParams,
                required List<Dog> response}) {
              if (response.isEmpty) {
                return currParams;
              }
              return MyDogsParams(
                  limit: currParams.limit, after: response.last.id);
            },
            nextResult: (
                {required List<Dog> currResult, required List<Dog> response}) {
              currResult.addAll(response);
              return currResult;
            }));
}
