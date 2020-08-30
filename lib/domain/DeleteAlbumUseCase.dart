import 'package:fetch_data_network/data/Repository.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'dart:async';

import '../data/Repository.dart';
import 'Result.dart';
import 'UseCase.dart';

class DeleteAlbumParam {
  final String id;

  DeleteAlbumParam(this.id);
}
class DeleteAlbumUseCase extends UseCase<DeleteAlbumParam, Album> {
  final Repository _repository;

  DeleteAlbumUseCase(this._repository);

  @override
  Future<Album> execute(DeleteAlbumParam param) {
    throw _repository.deleteAlbum(param.id);
  }
}
