import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePage(),
    );
  }
}

class TextBlock {
  final Color _color;
  final String _text;

  TextBlock(this._color, this._text);

  String get text => _text;

  Color get color => _color;
}

class _MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<_MyHomePage> {
  int _index = 0;
  final List<TextBlock> textBlocks = [
    TextBlock(Colors.red, 'every'),
    TextBlock(Colors.redAccent, 'schoolboy'),
    TextBlock(Colors.green, 'knows'),
    TextBlock(Colors.greenAccent, 'who'),
  ];

  void _increaseCounter() {
    setState(() {
      if (_index < textBlocks.length) {
        _index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textSpans = List<TextSpan>();
    for (var i = 0; i < _index; i++) {
      final textBlock = textBlocks[i];
      textSpans.add(TextSpan(
          text: textBlock.text,
          style: TextStyle(
            color: textBlock.color,
            fontSize: 32
          )
      ));
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(TextSpan(children: textSpans))
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
      ),
    );
  }
}