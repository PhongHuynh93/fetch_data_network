import 'package:fetch_data_network/app/ui/image/CachedNetworkImageWidget.dart';
import 'package:fetch_data_network/app/ui/image/InMemoryImageWidget.dart';
import 'package:fetch_data_network/app/ui/image/SimpleImageWidget.dart';
import 'package:fetch_data_network/app/ui/list/GridListWidget.dart';
import 'package:fetch_data_network/app/ui/list/HozListWidget.dart';
import 'package:fetch_data_network/app/ui/list/ListDifferentTypeWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ListDifferentTypeWidget(
    items: List<ListItem>.generate(
      1000,
          (i) => i % 6 == 0
          ? HeadingItem("Heading $i")
          : MessageItem("Sender $i", "Message body $i"),
    ),
  ));
}

