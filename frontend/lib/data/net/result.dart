class Result<T, E> {
  final T? data;
  final E? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}
