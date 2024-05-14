
abstract class ApiResource<T> {
  T? data;
  bool success;
  String? message;
  ApiResource(this.data, this.success, this.message);
}

class ApiResourceSucces<T> extends ApiResource<T> {
  ApiResourceSucces(T data) : super(data, true, null);
}

class ApiResourceError<T> extends ApiResource<T> {
  ApiResourceError(String? message) : super(null, false, message);
}
