import 'package:dailybib/model/book.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BooksDao{


  static Future<List<Book>> getBooks() async {
    final firestoreInstance = FirebaseFirestore.instance;
    List<Book> books = [];
    try {
      QuerySnapshot querySnapshot = await firestoreInstance.collection("books").get();
      querySnapshot.docs.forEach((result) {
        books.add(new Book(id: result['id'], name: result['name'], modern_name: result['modern_name'], new_testament: result['new_testament']));
      });
      print(books);
      return books;
      
    } catch(e){
      //return books;
    }
    
  }
}