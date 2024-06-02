import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubitForLibraryApp.dart';
import '../cubit/statesForlibraryApp.dart';
import '../models/Book.dart';
import 'BookItem.dart';
//محسن بركات
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Welcome to our Library",
        ),
      ),
      body: BlocBuilder<CubitForLibraryApp, StatesForlibraryApp>(
        builder: (context, state) {
          if (state is StateReadyForFetchingbooks) {
            return const LinearProgressIndicator();
          } else if (state is StateFetchingBooksSuccessfully) {
            List<Book> books = state.books;
            List<String>categories=[];
            for(Book book in books){
              categories.add(book.category);
            }
            return Column(children: [
              //كيندة علي
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Catategory(
                    text: categories.elementAt(index),
                  ),
                  itemCount: categories.length,
                ),
              ),
              //نور عمار
              Container(
                height: MediaQuery.of(context).size.height*0.9-180,
                padding: EdgeInsets.all(15),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>  bookItem(books[index]),
                  itemCount: books.length,
                  separatorBuilder: (context, index) => Divider(),
                ),
              )
            ],);
          } else if (state is StateFetchingBooksUnsuccessfully) {
            return Text(state.errorExp);
          }
          return Text("Error");

        },
      ),
    );
  }
}
//كيندة علي
class Catategory extends StatelessWidget {
  String? text;
  Catategory({this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Text("${text}"),
        ),
      ),
    );
  }
}
