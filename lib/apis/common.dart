import 'package:little_walk/models/dog_breed.dart';

abstract class FromJSON {
  fromJSON(Map m);
}

class ListResp<T> {
  List<T> list;
  int total;

  ListResp(this.list, this.total);
}
