class APIException implements Exception {
  int statusCode;
  String cause;

  APIException(this.statusCode, this.cause);

  @override
  String toString() {
    return """status code: $statusCode
    cause: $cause""";
  }
}
