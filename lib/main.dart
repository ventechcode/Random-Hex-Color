import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/home.dart';

/*
  @Copyright Lukas Schenkel 2020
  @Version v1.0
*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations( // Forces the Device Orientation to Portrait
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]
    );
    return MaterialApp(
      title: 'Random Hex Color',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
