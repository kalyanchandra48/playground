import 'dart:convert';

import 'package:flutter/foundation.dart';

class Book {
  String name;
  Book({
    required this.name,
  });

  Book copyWith({
    String? name,
  }) {
    return Book(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
  
    return result;
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() => 'Book(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Book &&
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
class Library {
  List<Book> books;
  Library({
    required this.books,
  });

  Library copyWith({
    List<Book>? books,
  }) {
    return Library(
      books: books ?? this.books,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'books': books.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory Library.fromMap(Map<String, dynamic> map) {
    return Library(
      books: List<Book>.from(map['books']?.map((x) => Book.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Library.fromJson(String source) => Library.fromMap(json.decode(source));

  @override
  String toString() => 'Library(books: $books)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Library &&
      listEquals(other.books, books);
  }

  @override
  int get hashCode => books.hashCode;
}
