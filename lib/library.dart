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
   // check if book is already existed in list
  Book? book = books.firstWhere(
          (element)=>  element.bookId == bookId
  );
  if(book != null && book.isBorrow){
    book.isBorrow = false;
    print('Book with ID $bookId returned');
  }else{
    print('Book is not found or not borrowed');
  }
  }

  borrowBook(String bookId , String userId){
    // check if book is already existed in list
   Book? book = books.firstWhere((element) => element.bookId == bookId);
   User? user = users.firstWhere((element) => element.id == userId);

   if(book != null && book.isBorrow == false){
     if(user !=null){
     book.isBorrow = true ;
     print('Book with ID $bookId borrowed');
   }else{
      users.add(user);
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