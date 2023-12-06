import "package:freezed_annotation/freezed_annotation.dart";
import 'package:flutter/foundation.dart';
import "package:test/test.dart";
import "../common.dart";
part 'common_test.freezed.dart';
part 'common_test.g.dart';

@freezed
class Params with _$Params {
  const factory Params({
    required String name,
    required int age,
    required Pagination pagination,
    required List<String> ids,
  }) = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}

void main() {
  test("convert object to params", () {
    final params = toParams(const Params(
        name: "test",
        age: 37,
        pagination: Pagination(page: 1, size: 20),
        ids: ["1", "2"]));
    expect(params == null, false);
    expect(params!["page"], 1);
    expect(params["size"], 20);
    expect(params["name"], "test");
    expect(params["age"], 37);
    expect(params["ids"], """["1","2"]""");
  });
}
