import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: TextFieldWidget(),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<TextFieldWidget> {
  final myController = TextEditingController();
  var focusNode;

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    focusNode = FocusNode();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The first text field is focused on as soon as the app starts.
            TextField(
              autofocus: true,
            ),
            // The second text field is focused on when a user taps the
            // FloatingActionButton.
            TextField(
              focusNode: focusNode,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed,
        // give focus to the text field using myFocusNode.
        onPressed: () => focusNode.requestFocus(),
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Retrieve Text Input'),
//     ),
//     body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: <Widget>[
//           TextField(
//             onChanged: (text) {
//               print("First text field: $text");
//             },
//           ),
//           TextField(
//             controller: myController,
//           ),
//         ],
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: () {
//         return showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 content: Text(myController.text),
//               );
//             });
//       },
//     ),
//   );
// }

  @override
  void dispose() {
    myController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
