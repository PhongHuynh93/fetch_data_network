import 'package:fetch_data_network/data/Repository.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'package:fetch_data_network/domain/UseCase.dart';
import 'dart:async';

import '../../data/Repository.dart';
import '../Result.dart';

class GetAlbumParam {}
class GetAlbumUseCase extends UseCase<GetAlbumParam, Album> {
  final Repository _repository = Repository();

  GetAlbumUseCase();

  @override
  Future<Album> execute(GetAlbumParam param) {
    return _repository.fetchAlbum();
  }
}
