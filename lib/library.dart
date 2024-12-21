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

  borrowBook(Book book){
  book.isBorrow = true;
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