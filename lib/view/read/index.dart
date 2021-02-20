import 'package:flutter/material.dart';

class ReadPage extends StatefulWidget {
  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Text(
                'Lectura',
                style: TextStyle(
                  fontSize: 32
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}