import 'package:fetch_data_network/data/model/Album.dart';
import 'package:fetch_data_network/domain/album/CreateAlbumUseCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAlbumWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateAlbumState();
  }
}

class _CreateAlbumState extends State<CreateAlbumWidget> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;
  final createAlbumUseCase = CreateAlbumUseCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: (_futureAlbum == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Enter Title'),
                ),
                RaisedButton(
                  child: Text('Create Data'),
                  onPressed: () {
                    setState(() {
                      _futureAlbum = createAlbumUseCase.invoke
                        (CreateAlbumParam(_controller.text)).then((value) => value.getData());
                    });
                  },
                ),
              ],
            )
          : FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.title);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
    );
  }
}
