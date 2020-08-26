import 'package:http/http.dart' as http;

import 'RestApi.dart';
import 'model/Album.dart';

class RepositoryImpl implements Repository {
  final RestApi _restApi;

  RepositoryImpl(this._restApi);

  @override
  Future<Album> fetchAlbum() {
    return _restApi.fetchAlbum();
  }
}

class Repository {
  Future<Album> fetchAlbum() {}
}