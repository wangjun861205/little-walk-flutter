import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/client.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/dog_breed.dart';

class DogCubit extends QueryCubit<String, Dog?> {
  final DogClient client;
  DogCubit({required this.client, Dog? dog, String? id})
      : super(Query(
            query: (id) async => await client.getDog(id),
            params: dog != null ? dog.id! : id!,
            result: dog));

  void setName(String name) {
    emit(state.copyWith(result: state.result!.copyWith(name: name)));
  }

  void setGender(String gender) {
    emit(state.copyWith(result: state.result!.copyWith(gender: gender)));
  }

  void setBreed(Breed breed) {
    emit(state.copyWith(result: state.result!.copyWith(breed: breed)));
  }

  void setPortrait(String portraitID) {
    emit(
        state.copyWith(result: state.result!.copyWith(portraitID: portraitID)));
  }

  void setBirthday(String birthday) =>
      emit(state.copyWith(result: state.result!.copyWith(birthday: birthday)));

  Future<String> addDog() async {
    emit(state.copyWith(isLoading: true, error: null));
    final res = await client.addDog(state.result!);
    emit(state.copyWith(isLoading: false));
    return res;
  }

  Future<Dog> updateDog() async {
    emit(state.copyWith(isLoading: true, error: null));
    final res = await client.updateDog(state.result!);
    emit(state.copyWith(isLoading: true));
    return res;
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

class MyDogsCubit extends QueryCubit<void, List<Dog>> {
  final DogClient client;
  MyDogsCubit({required this.client})
      : super(Query(
          params: null,
          result: [],
          query: (params) async => await client.myDogs(),
        ));
}

class BreedsCubit extends QueryCubit<void, List<Breed>> {
  final DogClient client;
  BreedsCubit({required this.client})
      : super(Query(
            query: (_) async => await client.breeds(),
            params: null,
            result: []));
}
