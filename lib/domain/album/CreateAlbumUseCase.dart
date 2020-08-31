import 'package:fetch_data_network/data/Repository.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'package:fetch_data_network/domain/UseCase.dart';
import 'dart:async';

import '../../data/Repository.dart';
import '../Result.dart';

class CreateAlbumParam {
  final String title;

  CreateAlbumParam(this.title);
}
class CreateAlbumUseCase extends UseCase<CreateAlbumParam, Album> {
  final Repository _repository = Repository();

  CreateAlbumUseCase();

  @override
  Future<Album> execute(CreateAlbumParam param) {
    return _repository.createAlbum(param.title);
  }
}
