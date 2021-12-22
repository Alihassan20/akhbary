import 'package:flutter/material.dart';

import '../../animation/animation_screen.dart';
import 'home_page.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          const  Scaffold(
              body:  HomePage(),
          ),
          IgnorePointer(
            child: AnimationScreen(
                color: Theme.of(context).accentColor
            ),
          )
        ]
    );
  }
}