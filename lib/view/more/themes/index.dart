import 'package:flutter/material.dart';

class ThemeSelection extends StatefulWidget {
  @override
  _ThemeSelectionState createState() => _ThemeSelectionState();
}

class _ThemeSelectionState extends State<ThemeSelection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Icon(Icons.arrow_back_ios)
            )
          ]
        ),
      ),
    );
  }
}