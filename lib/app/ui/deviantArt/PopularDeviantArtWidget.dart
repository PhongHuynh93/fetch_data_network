import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetch_data_network/data/model/Art.dart';
import 'package:fetch_data_network/data/model/DeviantArtList.dart';
import 'package:fetch_data_network/domain/art/GetPopularArtUseCase.dart';
import 'package:flutter/material.dart';

// fixme not work yet
class PopularDeviantArtWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopularDeviantArtState();
  }
}

class _PopularDeviantArtState extends State<PopularDeviantArtWidget> {
  Future<DeviantArtList<Art>> _futureListArt;

  @override
  void initState() {
    super.initState();
    final _getPopularArtUseCase = GetPopularArtUseCase();
    _futureListArt = _getPopularArtUseCase.invoke(GetPopularArtParam()).then((value) => value.getData());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DeviantArtList<Art>>(
      future: _futureListArt,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data.data;
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: item.preview.src,
                );
              });
        } else if (snapshot.hasError) {
          return Text("why is error here ${snapshot.error.toString()}");
        }

        return CircularProgressIndicator();
      },
    );
  }
}
