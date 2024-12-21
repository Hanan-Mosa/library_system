class Book{
  // attributes
  String bookId;
  String bookTitle;
  bool isBorrow;
  // constructor
  Book({required this.bookId,required this.bookTitle, this.isBorrow = false});

  // method
  void displayBookInfo(){
    print('Book ID :$bookId\n'
        ' Book Title : $bookTitle\n '
        'isBorrow $isBorrow');
    print('-----------------------');
  }

}