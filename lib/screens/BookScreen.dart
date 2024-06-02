import 'package:flutter/material.dart';
import '../models/Book.dart';
class bookScreen extends StatelessWidget {
  Book book;
  bookScreen(this.book, {super.key});
//علي غانم
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("title: ${book.title} by ${book.author}",style: TextStyle(fontSize: 25),),
                  Text("category: ${book.category}",style: TextStyle(fontSize: 25),),
                  Text("number of books: ${book.numbersOfBooks}",style: TextStyle(fontSize: 25),),
                  Text("descripation:\n ${book.descripation}",style: TextStyle(fontSize: 25),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
