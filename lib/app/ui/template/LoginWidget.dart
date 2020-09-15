import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;

  CurvedAnimation _iconAnimation;

  @override
  void initState() {
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() {
      this.setState(() {});
    });
    _iconAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/girl.jpeg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(
                  size: _iconAnimation.value * 140.0,
                ),
                new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Form(
                    autovalidate: true,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Enter Email",
                              fillColor: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        new MaterialButton(
                          height: 50.0,
                          minWidth: 150.0,
                          color: Colors.green,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Icon(Icons.forward),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
