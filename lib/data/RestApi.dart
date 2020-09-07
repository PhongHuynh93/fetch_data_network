import 'dart:io';

import 'package:http/http.dart' as http;
import 'model/Album.dart';
import 'dart:convert';

import 'model/Photo.dart';

class RestApi {
  Future<Album> fetchAlbum(http.Client client) async {
    final response = await client.get(
      'https://jsonplaceholder.typicode.com/albums/1',
      headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> deleteAlbum(http.Client client, String id) async {
    final http.Response response = await client.delete(
      'https://jsonplaceholder.typicode.com/albums/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server returned a 200 OK response,
      // then parse the JSON. After deleting,
      // you'll get an empty JSON `{}` response.
      // Don't return `null`, otherwise
      // `snapshot.hasData` will always return false
      // on `FutureBuilder`.
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }

  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/photos');
    return json
        .decode(response.body)
        .cast<Map<String, dynamic>>()
        .map<Photo>((json) => Photo.fromJson(json))
        .toList();
  }

  Future<Album> createAlbum(http.Client client, String title) async {
    final response = await client.post(
      'https://jsonplaceholder.typicode.com/albums',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> updateAlbum(http.Client client, String title) async {
    final response = await client.put(
      'https://jsonplaceholder.typicode.com/albums/1',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}
