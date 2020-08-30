import 'package:fetch_data_network/data/Repository.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'dart:async';

import '../data/Repository.dart';
import 'Result.dart';

class DeleteAlbumUseCase extends UseCase<> {
  final Repository _repository;

  DeleteAlbumUseCase(this._repository);

  Future<Result<Album>> deleteAlbum(String id) async {
    try {
      return Success(await _repository.deleteAlbum(id));
    } catch (ex) {
      return Future.error(Error(ex));
    }
  }
}
