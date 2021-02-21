import 'package:dailybib/dao/books_dao.dart';
import 'package:dailybib/model/book.dart';
import 'package:flutter/material.dart';

class ReadPage extends StatefulWidget {
  @override
  _ReadPageState createState() => _ReadPageState();
}



class _ReadPageState extends State<ReadPage> {
  List<Book> _books = [];

  void getBooks() async {
    var response = await BooksDao.getBooks();
    print(response);
    setState(() {
      this._books = response;
    });
  }

  @override
  void initState() {
    this.getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Lectura',
                    style: TextStyle(
                      fontSize: 32
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: DropdownButton<Book>(
                        items: _books?.map((Book book) {
                          return new DropdownMenuItem<Book>(
                            value: book,
                            child: new Text(book.modern_name),
                          );
                        })?.toList() ?? [],
                        onChanged: (_) {},
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      )
                    )
                  ]
                )
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey)
              ),
              
            ),
          )
        ],
      ),
      
    );
  }
}