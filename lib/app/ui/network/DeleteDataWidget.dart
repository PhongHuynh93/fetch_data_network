import 'package:flutter/material.dart';
import '../../../data/model/Album.dart';
import '../../../domain/Result.dart';

class DeleteAlbumWidget extends StatefulWidget {
  final _album;
  final void Function(String id) callback;
  DeleteAlbumWidget(this._album, this.callback);

  @override
  State<StatefulWidget> createState() {
    return _FetchDataState(_album, callback);
  }
}

class _FetchDataState extends State<DeleteAlbumWidget> {
  final _album;
  final void Function(String id) callback;

  _FetchDataState(this._album, this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Result<Object>>(
        future: _album,
        builder: (context, snapshot) {
          // If the connection is done,
          // check for response data or an error.
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              if (data is Success<Album>) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${data.data?.title ?? 'Deleted'}'),
                    RaisedButton(
                      child: Text('Delete Data'),
                      onPressed: () {
                          callback(data.data.id.toString());
                      },
                    ),
                  ],
                );
              } else if (data is Error) {
                return Text("${data.exception}");
              }
            }
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}