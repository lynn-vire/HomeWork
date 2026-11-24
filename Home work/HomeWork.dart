class Book {
  final String title;
  final String author;
  final int pages;
  bool _isRead = false;

  Book({required this.title, required this.author, required this.pages});

  bool get isRead => _isRead;

  void printInfo() {
    final readingStatus = _isRead ? 'прочитана' : 'не прочитана';
    print('"$title" — $author, $pages стр., $readingStatus');
  }

  void markAsRead() {
    _isRead = true;
  }
}

void main() {
  final books = [
    Book(
      title: 'Маленький принц',
      author: 'Антуан де Сент-Экзюпери',
      pages: 96,
    ),
    Book(
      title: 'Преступление и наказание',
      author: 'Фёдор Достоевский',
      pages: 672,
    ),
    Book(title: 'Мастер и Маргарита', author: 'Михаил Булгаков', pages: 480),
  ];

  books[0].markAsRead();
  books[2].markAsRead();

  print('Все книги:');
  for (final book in books) {
    book.printInfo();
  }

  print('\nНепрочитанные книги:');
  for (final book in books.where((book) => !book.isRead)) {
    book.printInfo();
  }
}
