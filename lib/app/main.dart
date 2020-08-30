import 'package:fetch_data_network/app/DeleteDataWidget.dart';
import 'package:fetch_data_network/app/FetchDataWidget.dart';
import 'package:fetch_data_network/data/Repository.dart';
import 'package:fetch_data_network/data/RestApi.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'package:fetch_data_network/domain/DeleteAlbumUseCase.dart';
import 'package:fetch_data_network/domain/GetAlbumUseCase.dart';
import 'package:fetch_data_network/domain/Result.dart';
import 'package:flutter/material.dart';

import '../data/Repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Future<Result<Album>> _album;
  void callback(String id) {
    setState(() {
      _album = DeleteAlbumUseCase(Repository()).invoke(DeleteAlbumParam(id));
    });
  }

  @override
  void initState() {
    super.initState();
    _album = GetAlbumUseCase(Repository()).fetchAlbum();
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
          body: Column(children: <Widget>[
//            FetchDataWidget(_album),
            DeleteDataWidget(_album, callback)
          ])),
    );
  }
}

