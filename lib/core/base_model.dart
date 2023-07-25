class BaseModel<T> {
  Status responseType;
  T? data;
  String? message;

  BaseModel.loading() : responseType = Status.loading;
  BaseModel.success(this.data) : responseType = Status.success;
  BaseModel.error(this.message) : responseType = Status.error;
}

enum Status { loading, success, error }
