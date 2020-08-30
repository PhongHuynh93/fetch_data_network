import 'Result.dart';
import 'Result.dart';

abstract class UseCase<Param, T> {
  Future<Result<T>> invoke(Param param) async {
    try {
      return Success(await execute(param));
    } catch (ex) {
      return Future.error(Error(ex));
    }
  }

  Future<T> execute(Param param);
}