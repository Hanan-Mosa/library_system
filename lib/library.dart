import 'dart:io';

import 'user.dart';
import 'book.dart';

class Library{
  List<User> users ;
  List<Book> books;

  Library(this.users ,this.books );

 void addBook(Book book){
    books.add(book);
  }
  void addUser(User user){
   users.add(user);
  }
  returnBook(String bookId){
   // check if book with bookId is existed in list and return it
  Book? book = books.firstWhere(
          (element)=>  element.bookId == bookId,
      orElse: ()=>Book(bookId: '',bookTitle: '')
  );
  if(book.bookId.isNotEmpty && book.isBorrow){
    book.isBorrow = false;
    print('Book with ID $bookId returned');
  }else{
    print('Book is not found or not borrowed');
  }
  }

  borrowBook(String bookId , int userId){
    // check if book with bookId is existed in list and return it
   Book book = books.firstWhere(
           (element) => element.bookId == bookId,
       orElse: ()=>Book(bookId: '',bookTitle: '') );

   User user = users.firstWhere((element) => element.id == userId, orElse: ()=>User(-1,''));

   if(book.bookId.isNotEmpty && book.isBorrow == false){
     if(user.id != -1){
     book.isBorrow = true ;
     print('Book with ID $bookId borrowed');
   }else{
       print('Please , enter your name');
      String name = stdin.readLineSync()!;
      users.add(User(userId,name));
      book.isBorrow = true ;
      print('Book with ID $bookId borrowed');
  }
   }else{
     print('Book is not found or already borrowed');
   }
  }
  void displayLibraryInfo(){
   print('Library Information');
   print('Books :');
   books.forEach((element) {
     element.displayBookInfo();
   });

   print('Users : ' );
   for(var user in users){
     user.displayUserInfo();
   }
  }

}