import 'package:flutter/material.dart';
import '../models/Book.dart';
import 'BookScreen.dart';
//حيدر سليمان
class bookItem extends StatefulWidget {
  Book book;
  bookItem(this.book, {super.key});
  @override
  State<StatefulWidget> createState()=>bookItemState();
}
class bookItemState extends State<bookItem>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("${widget.book.title}"),
                  Text("by ${widget.book.author}"),
                  Text("number of books:${widget.book.numbersOfBooks}"),
                  Text("price:${widget.book.price}"),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return bookScreen(widget.book);
                        },));
                      }, child: Text("Read more"))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
