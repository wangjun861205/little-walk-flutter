import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
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
