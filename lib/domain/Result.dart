class Result<T> {}

class Success<T> implements Result<T> {
  final T data;
  Success(this.data);
}

class Error implements Result {
  final Exception exception;
  Error(this.exception);
}

class Loading implements Result {
  Loading();
}