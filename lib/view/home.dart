import 'package:flutter/material.dart';
import 'package:dailybib/view/read/index.dart';
import 'package:dailybib/view/plan/index.dart';
import 'package:dailybib/view/more/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ReadPage(),
    PlanPage(),
    MorePage()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Lee'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Planea'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.segment),
            label: 'Más'
          )
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}