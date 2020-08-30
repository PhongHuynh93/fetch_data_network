import 'package:http/http.dart' as http;

import 'RestApi.dart';
import 'model/Album.dart';

// singleton
class _RepositoryImpl implements Repository {
  final RestApi _restApi = RestApi();

  _RepositoryImpl();

  @override
  Future<Album> fetchAlbum() {
    return _restApi.fetchAlbum();
  }

  @override
  Future<Album> deleteAlbum(String id) {
    return _restApi.deleteAlbum(id);
  }
}

// singleton
class Repository {

  static final repository = _RepositoryImpl();
  factory Repository() => repository;

  Future<Album> fetchAlbum() {}
  Future<Album> deleteAlbum(String id) {}
}