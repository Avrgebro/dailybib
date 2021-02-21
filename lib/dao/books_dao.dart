import 'package:dailybib/model/book.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BooksDao{


  static Future<List<Book>> getBooks() async {
    final firestoreInstance = FirebaseFirestore.instance;
    List<Book> books = [];
    try {
      QuerySnapshot querySnapshot = await firestoreInstance.collection("books").orderBy('id').get();
      querySnapshot.docs.forEach((result) {
        books.add(new Book(id: result['id'], name: result['name'], modern_name: result['modern_name'], new_testament: result['new_testament']));
      });
      print(books);
      return books;
      
    } catch(e){
      //return books;
    }
    
  }

  // static Future<List<int>> getBookChapters(book_id) async {
  //   final firestoreInstance = FirebaseFirestore.instance;
  //   try {
  //     QuerySnapshot querySnapshot = await firestoreInstance.collection("books").where('id', isEqualTo: book_id).collection('verses').get();
  //     querySnapshot.

  //   } catch(e){
  //     //return 0
  //   }

  // }
}