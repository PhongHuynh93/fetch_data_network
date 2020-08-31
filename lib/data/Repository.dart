import 'package:http/http.dart' as http;

import 'RestApi.dart';
import 'model/Album.dart';
import 'model/Photo.dart';

// singleton
class _RepositoryImpl implements Repository {
  final RestApi _restApi = RestApi();
  final http.Client client = http.Client();

  _RepositoryImpl();

  @override
  Future<Album> fetchAlbum() {
    return _restApi.fetchAlbum(client);
  }

  @override
  Future<Album> deleteAlbum(String id) {
    return _restApi.deleteAlbum(client, id);
  }

  @override
  Future<List<Photo>> fetchPhotos() {
    return _restApi.fetchPhotos(client);
  }

  @override
  Future<Album> createAlbum(String title) {
    return _restApi.createAlbum(client, title);
  }
}

// singleton
class Repository {
  static final repository = _RepositoryImpl();

  factory Repository() => repository;

  Future<Album> fetchAlbum() {}

  Future<Album> deleteAlbum(String id) {}

  Future<List<Photo>> fetchPhotos() {}

  Future<Album> createAlbum(String title) {}
}
