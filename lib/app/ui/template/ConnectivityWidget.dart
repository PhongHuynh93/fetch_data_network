
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectivityWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConnectivityState();
  }
}

class _ConnectivityState extends State<ConnectivityWidget> {
  Connectivity connectivity;

  String _connectionStatus = "unknown";

  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = Connectivity();
    subscription = connectivity.onConnectivityChanged.listen((event) {
      _connectionStatus = event.toString();
      print(_connectionStatus);
      if (event == ConnectivityResult.wifi || event == ConnectivityResult
          .mobile) {
        setState(() {

        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connectivity"),),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var mydata = snapshot.data;
            return new ListView.builder(
              itemBuilder: (context, i) => new ListTile(
                title: Text(mydata[i]['title']),
                // subtitle: Text(mydata[i]['body']),
              ),
              itemCount: mydata.length,
            );
          } else {
            return Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future getData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts/") ;
    if (response.statusCode == HttpStatus.ok) {
      var result = jsonDecode(response.body);
      return result;
    }
  }
}