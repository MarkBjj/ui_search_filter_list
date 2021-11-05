import 'package:flutter/material.dart';
import 'package:ui_search_filter_list/data/book_data.dart';
import 'package:ui_search_filter_list/models/book.dart';
import 'package:ui_search_filter_list/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String urlImage;
  late List<Book> books;
  String query = '';

  @override
  void initState() {
    super.initState();
//load books list
    books = allBooks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search In ListView & Filter ListView'),
        //centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 11.0),
            child: InkWell(
              child: IconButton(
                icon: const Icon(Icons.pages),
                highlightColor: Colors.pink,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          buildSearch(),
          //need Expanded or we can't see the ListView inside a Column
          Expanded(
            child: ListView.builder(
                //itemCount: 12,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return buildBook(book);
                  //return Text('book');
                }),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search by Title or Author',
        onChanged: searchBook,
// ignore: avoid_print
        // onChanged: () {
        //   print('search field input');
        // }
      );

  Widget buildBook(Book book) => ListTile(
      leading: Image.network(
        book.urlImage,
        height: 50,
        width: 50.0,
        fit: BoxFit.cover,
      ),
      title: Text(book.title),
      subtitle: Text(book.author));

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
