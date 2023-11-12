import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/dog_breed.dart';

class DogCubit extends Cubit<Dog> {
  DogCubit(Dog dog) : super(dog);

  void setName(String name) {
    state.name = name;
    emit(state);
  }

  void setGender(String gender) {
    emit(Dog(state.id, state.name, gender, state.breed, state.portraitID));
  }

  void setBreed(DogBreed? breed) {
    state.breed = breed;
    emit(state);
  }

  void setPortrait(String portraitID) {
    state.portraitID = portraitID;
    emit(state);
  }
}

class DogBreeds {
  String category;
  String breed;
  List<DogBreed> breeds;

  DogBreeds(this.category, this.breed, this.breeds);
}

class DogBreedsCubit extends Cubit<DogBreeds> {
  DogBreedsCubit(DogBreeds breed) : super(breed);

  void refresh(String category) async {
    final breeds = await fetchBreeds(category: category);
    emit(DogBreeds(category, "", breeds));
  }
}
