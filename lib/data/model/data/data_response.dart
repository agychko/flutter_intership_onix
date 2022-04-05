class DataResponse<T> {
  DataResponse._();

  factory DataResponse.success(T data) = RemoteResponseSuccess<T>;

  factory DataResponse.error(String errorMessage) = RemoteResponseError<T>;

  RemoteResponseSuccess<T> asSuccess() => this as RemoteResponseSuccess<T>;

  RemoteResponseError<T> asError() => this as RemoteResponseError<T>;

  bool isSuccess() => this is RemoteResponseSuccess;

  bool isError() => this is RemoteResponseError;
}

class RemoteResponseError<T> extends DataResponse<T> {
  RemoteResponseError(this.errorMessage) : super._();

  final String errorMessage;
}

class RemoteResponseSuccess<T> extends DataResponse<T> {
  RemoteResponseSuccess(this.data) : super._();

  final T data;
}
