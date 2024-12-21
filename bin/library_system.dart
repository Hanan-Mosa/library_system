import 'package:library_system/book.dart';
import 'package:library_system/library.dart';
import 'package:library_system/user.dart';

void main() {
Book book1 = Book(bookId:'1' , bookTitle:'The Old Man and The sea' );
Book book2 = Book(bookId: '2', bookTitle: "Harry Potter and the Sorcerer's Stone" );

User user1 = User(1, 'Omar');
User user2 = User(2,'Ali');

Library library = Library();

library.addBook(book1);
library.addBook(book2);
library.addUser(user1);
library.addUser(user2);
library.displayLibraryInfo();

library.borrowBook('1', 1);
library.displayLibraryInfo();
print('------------------------');
library.borrowBook('2', 3);
library.displayLibraryInfo();
print('------------------------');
library.returnBook('1');
library.displayLibraryInfo();

}
