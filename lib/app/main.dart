import 'package:flutter/material.dart';

import 'PopularDeviantArtWidget.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xff0c0c0c)),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Color(0xff00f4c5),
              tabs: [
                Tab(
                  text: "Popular",
                ),
                Tab(
                  text: "Newest",
                ),
                Tab(
                  text: "Topic",
                ),
//                fixme how to fix bottom overflow
//                Tab(
//                  text: "Daily deviations",
//                ),
              ],
            ),
            title: Text('Browse'),
          ),
          body: TabBarView(
            children: [
              PopularDeviantArtWidget(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
