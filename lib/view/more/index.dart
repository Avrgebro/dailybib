import 'package:dailybib/model/menu_items.dart';
import 'package:dailybib/view/more/themes/index.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {

  final List<MenuItems> _menu_pages = [
    MenuItems(label: 'Temas', page: ThemeSelection(), icon: Icon(Icons.brush)),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Text(
              'Más',
              style: TextStyle(
                fontSize: 32
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey)
              ),
              
            ),
          ),
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(child: _menu_pages[index].icon, flex: 1),
                        Expanded(child: Text(_menu_pages[index].label, style: TextStyle(fontSize: 18),), flex: 5),
                        Expanded(child: Icon(Icons.play_circle_fill_rounded, color: Theme.of(context).primaryColor,), flex: 1)
                      ],
                    )
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _menu_pages[index].page),
                  ),
                );
              },
              itemCount: _menu_pages.length,
            )
          )
        ],
      ),
      
    );
  }
  
}