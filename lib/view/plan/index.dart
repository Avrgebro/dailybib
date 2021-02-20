import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Text(
                'Planea',
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