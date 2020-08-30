import 'dart:io';

import 'package:http/http.dart' as http;
import 'model/Album.dart';
import 'dart:convert';

class RestApi {
//  todo use one client here
  Future<Album> fetchAlbum() async {
    final response = await http.get(
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

  Future<Album> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
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
}
