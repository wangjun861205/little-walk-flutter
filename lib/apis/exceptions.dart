class APIException implements Exception {
  int statusCode;
  String cause;

  APIException(this.statusCode, this.cause);
}
