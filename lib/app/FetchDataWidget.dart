import 'package:flutter/material.dart';
import '../data/model/Album.dart';
import '../domain/Result.dart';

class FetchAlbumWidget extends StatefulWidget {
  final _album;

  FetchAlbumWidget(this._album);

  @override
  State<StatefulWidget> createState() {
    return _FetchDataState(_album);
  }
}

class _FetchDataState extends State<FetchAlbumWidget> {
  final _album;

  _FetchDataState(this._album);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Result<Object>>(
        future: _album,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              if (data is Success<Album>) {
                return Text(data.data.title);
              } else if (data is Error) {
                return Text("${data.exception}");
              }
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}