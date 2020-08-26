import 'package:fetch_data_network/data/RepositoryImpl.dart';
import 'package:fetch_data_network/data/RestApi.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'package:fetch_data_network/domain/GetAlbumUseCase.dart';
import 'package:fetch_data_network/domain/Result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    var restApi = RestApi();
    var repository = RepositoryImpl(restApi);

    return _MyAppState(repository);
  }
}

class _MyAppState extends State<MyApp> {
  Future<Result<Album>> _album;
  Repository _repository;

  _MyAppState(this._repository);

  @override
  void initState() {
    super.initState();
    _album = GetAlbumUseCase(_repository).fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Result<Object>>(
            future: _album,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                if (data is Success<Album>) {
                  return Text(data.data.title);
                } else
                  if (data is Error) {
                  return Text("${data.exception}");
                }
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

