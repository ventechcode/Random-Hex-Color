import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final hex = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F']; // Defining all Hexadecimal characters into a List
  String hexColor = '#FFFFFF';

  Color fromHex(String hexString) { // Converts a Hex Color String into a flutter Color Widget
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('FF'); // Appending FF for an Opacity of 255 ==> Color is 100% visible
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String getRandomHexColor() { // Returns a random Hex Color String
    String hexString = '#';
    for (int i = 0; i < 6; i++) {
      hexString += hex[Random.secure().nextInt(hex.length)].toString();
    }
    return hexString;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          hexColor = getRandomHexColor(); // Updating the UI with a new random Hex Color
        });
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: fromHex(hexColor),
          body: HexColor(hexColor),
        ),
      ),
    );
  }
}
