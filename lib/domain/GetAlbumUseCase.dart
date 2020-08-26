import 'package:fetch_data_network/data/RepositoryImpl.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'dart:async';

import 'Result.dart';

class GetAlbumUseCase {
  final Repository _repository;

  GetAlbumUseCase(this._repository);

  Future<Result<Album>> fetchAlbum() async {
    try {
      return Success(await _repository.fetchAlbum());
    } catch (ex) {
      return Future.error(Error(ex));
    }
  }
}
