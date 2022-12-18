import 'package:flutter_application_1/data/book_data.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/book.dart';
import 'package:flutter_application_1/widgets/components/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin/book_page.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Book> books;
  String query = '';

  @override
  void initState() {
    super.initState();

    books = allBooks;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Widget buildBook(Book book) => ListTile(
      leading: Image.network(
        book.urlImage,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      ),
      title: Text(book.title),
      subtitle: Text(book.author),
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => BookPage(book: book))));

  void searchBook(String query) {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}
