class Result<T> {
  T getData() {
    if (this is Success) {
      return (this as Success).data;
    } else {
      return null;
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Error extends Result {
  final Exception exception;
  Error(this.exception);
}

class Loading extends Result {
  Loading();
}