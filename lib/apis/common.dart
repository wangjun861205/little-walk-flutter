import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:little_walk/models/dog_breed.dart';

abstract class FromJSON {
  fromJSON(Map m);
}

class ListResp<T> {
  List<T> list;
  int total;

  ListResp(this.list, this.total);
}

const authToken = "AUTH_TOKEN";

Future<String?> getAuthToken() async {
  const store = FlutterSecureStorage();
  return store.read(key: authToken);
}

Future<void> putAuthToken(String token) async {
  const store = FlutterSecureStorage();
  return store.write(key: authToken, value: token);
}

class Pagination {
  int page;
  int size;
  Pagination(this.page, this.size);
}
