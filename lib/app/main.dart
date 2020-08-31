import 'package:fetch_data_network/app/CreateAlbumWidget.dart';
import 'package:fetch_data_network/app/DeleteDataWidget.dart';
import 'package:fetch_data_network/data/model/Album.dart';
import 'package:fetch_data_network/domain/Result.dart';
import 'package:fetch_data_network/domain/album/DeleteAlbumUseCase.dart';
import 'package:fetch_data_network/domain/album/GetAlbumUseCase.dart';
import 'package:flutter/material.dart';

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
      _album = DeleteAlbumUseCase().invoke(DeleteAlbumParam(id));
    });
  }

  // The initState() method is called exactly once and then never again. If you
  // want to have the option of reloading the API in response to an InheritedWidget changing, put the call into the didChangeDependencies() method.
  @override
  void initState() {
    super.initState();
    _album = GetAlbumUseCase().invoke(GetAlbumParam());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
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
          body: CreateAlbumWidget(),
    ));
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

