import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailybib/dao/books_dao.dart';
import 'package:dailybib/model/book.dart';
import 'package:flutter/material.dart';

class ReadPage extends StatefulWidget {
  @override
  _ReadPageState createState() => _ReadPageState();
}



class _ReadPageState extends State<ReadPage> {
  List<Book> _books = [];
  var _selected_book = null;
  var _selected_chapter = null;

  void getBooks() async {
    var response = await BooksDao.getBooks();
    print(response);
    setState(() {
      this._books = response;
    });
  }

  // @override
  // void initState() {
  //   this.getBooks();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
     
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: firestoreInstance.collection('books').orderBy('id').snapshots(),
                          builder: (context, snapshot) {
                            return snapshot.hasData ? DropdownButtonFormField(
                              value: this._selected_book,
                              isExpanded: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                                
                              ),
                              items: snapshot.data.docs?.map((DocumentSnapshot book) {
                                return new DropdownMenuItem<DocumentReference>(
                                  value: book.reference,
                                  child: new Text(book['modern_name']),
                                );
                              })?.toList() ?? [],
                              hint: Text('Libro'),
                              onChanged: (dynamic book) {
                                print(book);
                                setState(() {
                                  this._selected_book = book;
                                });
                              },
                            ) : DropdownButtonFormField(items: [], onChanged: null, hint: Text('Libro'), decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                                
                              ),);
                          }
                        ),
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: this._selected_book?.collection('chapters')?.orderBy('id')?.snapshots(),
                          builder: (context, snapshot) {
                            return snapshot.hasData ? DropdownButtonFormField(
                              value: this._selected_chapter,
                              isExpanded: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                                
                              ),
                              items: snapshot?.data?.docs?.map((DocumentSnapshot chapter) {
                                return new DropdownMenuItem<DocumentReference>(
                                  value: chapter.reference,
                                  child: new Text(chapter['id'].toString()),
                                );
                              })?.toList() ?? [],
                              hint: Text('Capitulo'),
                              onChanged: (dynamic chapter) {
                                //print(book);
                                setState(() {
                                  this._selected_chapter = chapter;
                                });
                              },
                            ) : DropdownButtonFormField(items: [], onChanged: null, hint: Text('Capítulo'), decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                                
                              ),);
                          }
                        ),
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
          ),
          Container(
            child: Center(
              heightFactor: 1.3,
              child: Column(
                children: [
                  Image(image: AssetImage('assets/images/read.png')),
                  Text('¡Selecciona un libro y capítulo para empezar a leer!')
                ],
              ),
              
            ),
          )
        ],
      ),
      
    );
  }
}